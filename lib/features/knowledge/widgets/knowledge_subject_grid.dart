import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class KnowledgeSubjectGrid extends StatelessWidget {
  const KnowledgeSubjectGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildSubjectCard('数据结构', '已学 32%', 12, Colors.blue)),
              const SizedBox(width: 12),
              Expanded(child: _buildSubjectCard('组成原理', '已学 15%', 8, Colors.orange)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildSubjectCard('操作系统', '已学 45%', 3, Colors.green)),
              const SizedBox(width: 12),
              Expanded(child: _buildSubjectCard('计算机网络', '已学 0%', 0, Colors.purple)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectCard(String name, String progress, int reviewCount, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.shade50.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ),
              Icon(Icons.chevron_right_rounded, size: 20, color: color.shade300),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                progress,
                style: TextStyle(fontSize: 11, color: AppTheme.textSecondary.withValues(alpha: 0.8)),
              ),
              if (reviewCount > 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: color.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '待复习 $reviewCount',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: color.shade700,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
