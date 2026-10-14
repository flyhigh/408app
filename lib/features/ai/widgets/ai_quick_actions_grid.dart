import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../pages/ai_chat_page.dart';

class AiQuickActionsGrid extends StatelessWidget {
  const AiQuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.0,
        children: [
          _buildActionCard(context, Icons.lightbulb_outline_rounded, '给我安排今天', '按时间状态智能生成'),
          _buildActionCard(context, Icons.warning_amber_rounded, '我被打断了', '重新核算可用时长'),
          _buildActionCard(context, Icons.menu_book_rounded, '解释知识点', '带上下文的讲解'),
          _buildActionCard(context, Icons.edit_document, '分析这道错题', '定位核心薄弱点'),
          _buildActionCard(context, Icons.fact_check_outlined, '帮我做复盘', '一键生成今日总结'),
          _buildActionCard(context, Icons.directions_subway_filled_outlined, '生成通勤卡片', '抽取关键考点'),
        ],
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, IconData icon, String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const AiChatPage()));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.border.withValues(alpha: 0.6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.015),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppTheme.textSecondary.withValues(alpha: 0.8), size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 9,
                      color: AppTheme.textSecondary.withValues(alpha: 0.8),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
