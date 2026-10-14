import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../widgets/ai_composer_bar.dart';
import '../widgets/ai_context_card.dart';
import '../widgets/ai_header.dart';
import '../widgets/ai_insight_card.dart';
import '../widgets/ai_job_preview_card.dart';
import '../widgets/ai_quick_actions_grid.dart';
import '../widgets/ai_recent_chat_card.dart';

class AiHomePage extends StatelessWidget {
  const AiHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: ListView(
              padding: const EdgeInsets.only(bottom: 120), // Reserve for Composer Bar
              children: [
                const AiHeader(),
                const AiInsightCard(),
                const AiQuickActionsGrid(),
                const SizedBox(height: 8),
                const AiContextCard(),
                const SizedBox(height: 20),
                _buildSectionTitle('最近会话'),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: AiRecentChatCard(
                    title: '帮我解释 PV 操作的原理',
                    tag: 'OS',
                    time: '今天 14:20',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: AiRecentChatCard(
                    title: '把今天计划压缩到 2 小时',
                    tag: '重排',
                    time: '昨天',
                  ),
                ),
                const SizedBox(height: 20),
                const AiJobPreviewCard(),
              ],
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AiComposerBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: AppTheme.textPrimary,
        ),
      ),
    );
  }
}
