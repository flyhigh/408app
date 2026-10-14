import 'package:app408/features/auth/pages/auth_entry_page.dart';
import 'package:app408/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('auth entry page uses the page background token', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: AuthEntryPage(
          onBack: () {},
          onContinue: (_) {},
          onPasswordLogin: (_) {},
        ),
      ),
    );

    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, AppTheme.pageBackground);
  });
}
