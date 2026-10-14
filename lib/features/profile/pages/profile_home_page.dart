import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../widgets/profile_current_goal_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_membership_card.dart';
import '../widgets/profile_menu_list_item.dart';
import '../widgets/profile_persona_card.dart';
import '../widgets/profile_user_info_card.dart';

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            const ProfileHeader(),
            const ProfileUserInfoCard(),
            const SizedBox(height: 8),
            const ProfileCurrentGoalCard(),
            const SizedBox(height: 8),
            const ProfilePersonaCard(),
            const SizedBox(height: 16),
            _buildSectionTitle('学习设置'),
            const SizedBox(height: 8),
            const ProfileMenuListItem(
              icon: Icons.face_retouching_natural_rounded,
              title: '编辑学习画像',
              subtitle: '影响 AI 如何与你对话',
            ),
            const ProfileMenuListItem(
              icon: Icons.access_time_rounded,
              title: '时间模板',
              subtitle: '工作日/周末可学习时段',
            ),
            const ProfileMenuListItem(
              icon: Icons.notifications_active_outlined,
              title: '通知设置',
            ),
            const SizedBox(height: 16),
            const ProfileMembershipCard(),
            const SizedBox(height: 16),
            _buildSectionTitle('帮助与系统'),
            const SizedBox(height: 8),
            const ProfileMenuListItem(
              icon: Icons.help_outline_rounded,
              title: '帮助与反馈',
            ),
            const ProfileMenuListItem(
              icon: Icons.security_rounded,
              title: '账号与安全',
            ),
            const ProfileMenuListItem(
              icon: Icons.info_outline_rounded,
              title: '关于我们',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }
}
