import 'package:app408/features/ai/pages/ai_chat_page.dart';
import 'package:app408/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ai chat page renders its input bar', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: const AiChatPage(),
      ),
    );

    expect(find.byType(TextField), findsOneWidget);
  });
}
