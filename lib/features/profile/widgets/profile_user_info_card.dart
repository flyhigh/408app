import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class ProfileUserInfoCard extends StatelessWidget {
  const ProfileUserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppTheme.textSecondary.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppTheme.primary.withValues(alpha: 0.1),
                  child: const Text('王', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '小王',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppTheme.textPrimary),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.amber.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.amber.withValues(alpha: 0.5)),
                            ),
                            child: const Text(
                              '免费版',
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.amber),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '408 备考中 · 连续学习 7 天',
                        style: TextStyle(fontSize: 13, color: AppTheme.textSecondary.withValues(alpha: 0.8)),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: AppTheme.textSecondary.withValues(alpha: 0.5)),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(height: 1, thickness: 1),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.insights_rounded, size: 16, color: AppTheme.primary.withValues(alpha: 0.8)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '你最近晚上 8~10 点专注力最高。',
                    style: TextStyle(fontSize: 12, color: AppTheme.textSecondary.withValues(alpha: 0.9)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
