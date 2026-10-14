import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../widgets/knowledge_browse_grid.dart';
import '../widgets/knowledge_continue_card.dart';
import '../widgets/knowledge_header.dart';
import '../widgets/knowledge_recent_card.dart';
import '../widgets/knowledge_search_bar.dart';
import '../widgets/knowledge_subject_grid.dart';
import '../widgets/knowledge_weak_topic_card.dart';

class KnowledgeHomePage extends StatelessWidget {
  const KnowledgeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            const KnowledgeHeader(),
            const KnowledgeSearchBar(),
            const KnowledgeSubjectGrid(),
            const KnowledgeContinueCard(),
            const SizedBox(height: 8),
            const KnowledgeBrowseGrid(),
            const SizedBox(height: 16),
            _buildSectionTitle('最近查看'),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: KnowledgeRecentCard(
                title: '死锁的四个必要条件',
                path: '操作系统 > 死锁',
                mastery: '模糊',
                timeText: '今天 09:13',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: KnowledgeRecentCard(
                title: 'IPv4 散列与首部格式',
                path: '计算机网络 > 网络层 > IPv4',
                mastery: '会了',
                timeText: '昨天 15:42',
              ),
            ),
            const SizedBox(height: 8),
            const KnowledgeWeakTopicCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: AppTheme.textPrimary,
        ),
      ),
    );
  }
}
