import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app408/app/view/app.dart';

void main() {
  testWidgets('starts from splash and enters auth flow', (tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('让你的 408 计划真正跑下去'), findsOneWidget);
    expect(find.text('开始登录'), findsOneWidget);

    await tester.tap(find.text('开始登录'));
    await tester.pumpAndSettle();

    expect(find.text('先登录，继续你的备考计划'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, '继续'), findsOneWidget);
  });

  testWidgets('keeps continue disabled for invalid identity', (tester) async {
    await tester.pumpWidget(const App());
    await tester.tap(find.text('开始登录'));
    await tester.pumpAndSettle();

    final continueButton = tester.widget<ElevatedButton>(
      find.widgetWithText(ElevatedButton, '继续'),
    );
    expect(continueButton.onPressed, isNull);

    await tester.enterText(find.byType(TextField).first, '13800138000');
    await tester.pump();

    final enabledButton = tester.widget<ElevatedButton>(
      find.widgetWithText(ElevatedButton, '继续'),
    );
    expect(enabledButton.onPressed, isNotNull);
  });

  testWidgets('can switch auth branches and enter app shell', (tester) async {
    await tester.pumpWidget(const App());
    await tester.tap(find.text('开始登录'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).first, '13800138000');
    await tester.pump();

    await tester.tap(find.text('使用密码登录'));
    await tester.pumpAndSettle();
    expect(find.text('输入密码'), findsOneWidget);

    await tester.tap(find.text('改用验证码登录'));
    await tester.pumpAndSettle();
    expect(find.text('输入验证码'), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, '123456');
    await tester.pump();
    await tester.tap(find.widgetWithText(ElevatedButton, '登录并继续'));
    await tester.pump(const Duration(milliseconds: 600));
    await tester.pumpAndSettle();

    expect(find.text('登录成功'), findsOneWidget);

    final startButton = find.widgetWithText(ElevatedButton, '开始初始化');
    await tester.ensureVisible(startButton);
    await tester.tap(startButton);
    await tester.pumpAndSettle();

    expect(find.text('今日'), findsNWidgets(2));
    expect(find.text('知识库'), findsOneWidget);
    expect(find.text('复习'), findsOneWidget);
    expect(find.text('AI'), findsOneWidget);
    expect(find.text('我的'), findsOneWidget);
  });
}
