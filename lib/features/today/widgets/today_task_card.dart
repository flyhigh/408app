import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../pages/task_execution_page.dart';

class TodayTaskCard extends StatelessWidget {
  final String subject;
  final String title;
  final String estimatedTime;
  final String locationInfo;
  final int relationCount;
  final bool isMust;

  const TodayTaskCard({
    super.key,
    required this.subject,
    required this.title,
    required this.estimatedTime,
    required this.locationInfo,
    required this.relationCount,
    this.isMust = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildTag(subject, Colors.blue.shade100, Colors.blue.shade700),
              const SizedBox(width: 8),
              if (isMust)
                _buildTag('MUST', AppTheme.danger.withValues(alpha: 0.1), AppTheme.danger)
              else
                _buildTag('NICE', Colors.green.shade100, Colors.green.shade700),
              const SizedBox(width: 8),
              _buildTag('今日计划', AppTheme.primary.withValues(alpha: 0.1), AppTheme.primary),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz_rounded),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: AppTheme.textSecondary,
                iconSize: 20,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.timer_outlined, size: 14, color: AppTheme.textSecondary.withValues(alpha: 0.8)),
              const SizedBox(width: 4),
              Text(
                '预计 $estimatedTime',
                style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
              ),
              const SizedBox(width: 12),
              Icon(Icons.map_outlined, size: 14, color: AppTheme.textSecondary.withValues(alpha: 0.8)),
              const SizedBox(width: 4),
              Text(
                locationInfo,
                style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
              ),
              const SizedBox(width: 12),
              Icon(Icons.link_rounded, size: 14, color: AppTheme.textSecondary.withValues(alpha: 0.8)),
              const SizedBox(width: 4),
              Text(
                '关联 $relationCount',
                style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
              ),
            ],
          ),
        const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => TaskExecutionPage(title: title, tag: isMust ? 'MUST' : 'NICE')));
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text('开始', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    side: BorderSide(color: AppTheme.border),
                  ),
                  child: const Text('改时长', style: TextStyle(color: AppTheme.textPrimary)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    side: BorderSide(color: AppTheme.border),
                  ),
                  child: const Text('问 AI', style: TextStyle(color: AppTheme.textPrimary)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}
