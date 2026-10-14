import 'package:app408/features/ai/widgets/ai_context_card.dart';
import 'package:app408/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ai context card uses ai purple tags for context chips', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        home: const Scaffold(body: AiContextCard()),
      ),
    );

    final tagContainers = find.byWidgetPredicate((widget) {
      if (widget is! Container) {
        return false;
      }

      final decoration = widget.decoration;
      return decoration is BoxDecoration &&
          decoration.color == AppTheme.aiPurple.withValues(alpha: 0.1);
    });

    expect(tagContainers, findsNWidgets(4));
  });
}
