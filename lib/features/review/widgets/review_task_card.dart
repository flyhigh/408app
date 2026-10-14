import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class ReviewTaskCard extends StatelessWidget {
  final String title;
  final String intervalTag;
  final String source;
  final String lastResult;
  final bool isOverdue;

  const ReviewTaskCard({
    super.key,
    required this.title,
    required this.intervalTag,
    required this.source,
    required this.lastResult,
    this.isOverdue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isOverdue ? AppTheme.danger.withValues(alpha: 0.3) : AppTheme.border.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
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
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              if (isOverdue)
                _buildTag('逾期', AppTheme.danger.withValues(alpha: 0.1), AppTheme.danger)
              else
                _buildTag(intervalTag, AppTheme.primary.withValues(alpha: 0.1), AppTheme.primary),
              const SizedBox(width: 6),
              _buildStatusDot(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  source,
                  style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                lastResult,
                style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    side: BorderSide(color: isOverdue ? AppTheme.danger : AppTheme.primary),
                    foregroundColor: isOverdue ? AppTheme.danger : AppTheme.primary,
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
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    side: BorderSide(color: AppTheme.border.withValues(alpha: 0.8)),
                    foregroundColor: AppTheme.textPrimary,
                  ),
                  child: const Text('会了'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    foregroundColor: AppTheme.textSecondary,
                  ),
                  child: const Text('延后'),
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
          fontSize: 11,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildStatusDot() {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: AppTheme.textSecondary.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
    );
  }
}
