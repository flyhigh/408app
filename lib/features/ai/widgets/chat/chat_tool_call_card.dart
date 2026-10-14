import 'package:flutter/material.dart';

import '../../../../shared/theme/app_theme.dart';

class ChatToolCallCard extends StatelessWidget {
  final String actionName;
  final String details;
  final IconData icon;
  final VoidCallback? onApply;

  const ChatToolCallCard({
    super.key,
    required this.actionName,
    required this.details,
    required this.icon,
    this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(
           maxWidth: MediaQuery.of(context).size.width * 0.85,
        ),
        decoration: BoxDecoration(
          color: AppTheme.success.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.success.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppTheme.success, size: 20),
                const SizedBox(width: 8),
                Text(
                  actionName,
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: AppTheme.textPrimary),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              details,
              style: TextStyle(fontSize: 13, height: 1.5, color: AppTheme.textSecondary.withValues(alpha: 0.9)),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onApply,
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.success,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('应用此更新', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
