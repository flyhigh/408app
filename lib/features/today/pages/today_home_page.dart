import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../widgets/today_header.dart';
import '../widgets/today_review_card.dart';
import '../widgets/today_sticky_cta.dart';
import '../widgets/today_sub_nav.dart';
import '../widgets/today_summary_card.dart';
import '../widgets/today_task_card.dart';

class TodayHomePage extends StatelessWidget {
  const TodayHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: ListView(
              padding: const EdgeInsets.only(bottom: 120), // reserve for Sticky CTA
              children: [
                const TodayHeader(),
                const TodaySubNav(),
                const SizedBox(height: 8),
                const TodaySummaryCard(),
                const SizedBox(height: 8),
                _buildSectionHeader(
                  '今天必须做',
                  '优先保住这 3 个任务',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TodayTaskCard(
                    subject: 'OS',
                    title: '进程同步基础与经典题型',
                    estimatedTime: '45m',
                    locationInfo: '第 2 轮 · 第 3 周',
                    relationCount: 3,
                    isMust: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TodayTaskCard(
                    subject: 'Net',
                    title: 'TCP 拥塞控制综合分析',
                    estimatedTime: '60m',
                    locationInfo: '第 1 轮 · 第 4 周',
                    relationCount: 5,
                    isMust: true,
                  ),
                ),
                const SizedBox(height: 12),
                _buildSectionHeader(
                  '今日复习',
                  'D1 / D3 / D7 到期任务',
                  actionText: '全部查看',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TodayReviewCard(
                    topic: '死锁的四个必要条件',
                    intervalTag: 'D1',
                    sourceTask: '死锁概念与预防',
                    masteryLevel: '模糊',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TodayReviewCard(
                    topic: 'IPv4 报文段首部格式',
                    intervalTag: 'D3',
                    sourceTask: '网络层协议大串讲',
                    masteryLevel: '会了',
                  ),
                ),
                const SizedBox(height: 12),
                _buildCollapsedNiceSection(),
                const SizedBox(height: 16),
                _buildBacklogEntry(),
              ],
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: TodayStickyCta(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle, {String? actionText}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
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
              const SizedBox(width: 10),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                ),
              ),
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
            )
          else
            const Icon(Icons.expand_more_rounded, size: 20, color: AppTheme.textSecondary),
        ],
      ),
    );
  }

  Widget _buildCollapsedNiceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppTheme.surface.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.border.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '有余力再做',
                  style: TextStyle(fontWeight: FontWeight.w700, color: AppTheme.textPrimary),
                ),
                const SizedBox(height: 2),
                Text(
                  '2 个 NICE 任务',
                  style: TextStyle(fontSize: 12, color: AppTheme.textSecondary.withValues(alpha: 0.8)),
                ),
              ],
            ),
            const Icon(Icons.chevron_right_rounded, color: AppTheme.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildBacklogEntry() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: AppTheme.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '积压任务 4 个',
                  style: TextStyle(fontWeight: FontWeight.w700, color: AppTheme.primary),
                ),
                const SizedBox(height: 4),
                Text(
                  '2 个来自昨天，1 个来自重排',
                  style: TextStyle(fontSize: 12, color: AppTheme.textSecondary.withValues(alpha: 0.8)),
                ),
              ],
            ),
            FilledButton.tonal(
              onPressed: () {},
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(64, 32),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: const Text('去整理', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }
}
