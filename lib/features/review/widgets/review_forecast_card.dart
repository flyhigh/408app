import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class ReviewForecastCard extends StatelessWidget {
  const ReviewForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.border.withValues(alpha: 0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '未来 7 天复习压力',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textPrimary,
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: AppTheme.textSecondary.withValues(alpha: 0.6)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Mocking a tiny bar chart
                _buildBar(12, '今', isToday: true),
                _buildBar(28, '四', isHigh: true),
                _buildBar(15, '五'),
                _buildBar(8, '六'),
                _buildBar(35, '日', isHigh: true),
                _buildBar(10, '一'),
                _buildBar(5, '二'),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '周四和周日复习较多',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.textSecondary.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(int value, String day, {bool isToday = false, bool isHigh = false}) {
    return Column(
      children: [
        Container(
          width: 24,
          height: (value * 2.0).clamp(4.0, 60.0), // Mock scale
          decoration: BoxDecoration(
            color: isToday
                ? AppTheme.primary
                : (isHigh ? AppTheme.warning.withValues(alpha: 0.8) : AppTheme.primary.withValues(alpha: 0.2)),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          day,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isToday ? FontWeight.w800 : FontWeight.w500,
            color: isToday ? AppTheme.primary : AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }
}
