import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class KnowledgeWeakTopicCard extends StatelessWidget {
  const KnowledgeWeakTopicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.danger.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.danger.withValues(alpha: 0.2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.danger.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.flare_rounded, color: AppTheme.danger, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '你最近容易混淆这些知识点',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.danger,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• PV 操作 vs 临界区\n• 快表 vs Cache',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.danger.withValues(alpha: 0.8),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            FilledButton.tonal(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.danger.withValues(alpha: 0.1),
                foregroundColor: AppTheme.danger,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(64, 32),
                padding: const EdgeInsets.symmetric(horizontal: 14),
              ),
              child: const Text('重练', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }
}
