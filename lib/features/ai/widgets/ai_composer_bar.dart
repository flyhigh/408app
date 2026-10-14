import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class AiComposerBar extends StatelessWidget {
  const AiComposerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline_rounded),
              color: AppTheme.textSecondary,
            ),
            Expanded(
              child: Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppTheme.pageBackground,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: AppTheme.border.withValues(alpha: 0.8)),
                ),
                alignment: Alignment.centerLeft,
                // Using Text pretending to be TextField for mockup
                child: Text(
                  '问我计划、知识点、复习...',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSecondary.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_upward_rounded),
              color: Colors.white,
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.primary,
                padding: const EdgeInsets.all(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
