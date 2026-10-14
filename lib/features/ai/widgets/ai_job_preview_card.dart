import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class AiJobPreviewCard extends StatelessWidget {
  const AiJobPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.border.withValues(alpha: 0.6)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '异步任务中心',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textPrimary,
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: AppTheme.textSecondary.withValues(alpha: 0.6)),
              ],
            ),
            const SizedBox(height: 12),
            _buildJobRow('周报草稿 (W12)', '已完成', Colors.green),
            const Divider(height: 16, thickness: 1),
            _buildJobRow('通勤卡片生成 (OS组)', '处理中', AppTheme.primary),
            const Divider(height: 16, thickness: 1),
            _buildJobRow('批量错题解析 (7题)', '失败', AppTheme.danger),
          ],
        ),
      ),
    );
  }

  Widget _buildJobRow(String title, String status, Color statusColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary),
        ),
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              status,
              style: TextStyle(fontSize: 12, color: statusColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
