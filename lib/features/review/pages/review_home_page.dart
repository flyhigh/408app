import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../widgets/review_forecast_card.dart';
import '../widgets/review_header.dart';
import '../widgets/review_sticky_cta.dart';
import '../widgets/review_sub_nav.dart';
import '../widgets/review_summary_card.dart';
import '../widgets/review_task_card.dart';
import '../widgets/review_wrong_question_card.dart';

class ReviewHomePage extends StatelessWidget {
  const ReviewHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: ListView(
              padding: const EdgeInsets.only(bottom: 120), // Reserve for Sticky CTA
              children: [
                const ReviewHeader(),
                const ReviewSubNav(),
                const SizedBox(height: 8),
                const ReviewSummaryCard(),
                const SizedBox(height: 16),
                _buildSectionTitle(
                  '今天到期',
                  subtitle: '优先处理 D1 / D3',
                  actionText: '查看全部',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ReviewTaskCard(
                    title: '死锁解除方法',
                    intervalTag: 'D3',
                    source: '来自 OS - 死锁模块',
                    lastResult: '上次：还不稳',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ReviewTaskCard(
                    title: 'CSMA/CD 协议基础',
                    intervalTag: 'D1',
                    source: '来自 计网 - 局域网',
                    lastResult: '上次：模糊',
                    isOverdue: true,
                  ),
                ),
                const SizedBox(height: 16),
                const ReviewWrongQuestionCard(),
                const SizedBox(height: 16),
                const ReviewForecastCard(),
              ],
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ReviewStickyCta(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, {String? subtitle, String? actionText}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(width: 10),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ]
            ],
          ),
          if (actionText != null)
            Text(
              actionText,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppTheme.primary,
              ),
            ),
        ],
      ),
    );
  }
}
