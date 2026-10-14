import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../../auth/widgets/auth_submit_button.dart';

String maskIdentity(String identity) {
  final value = identity.trim();
  if (value.contains('@')) {
    final parts = value.split('@');
    final name = parts.first;
    final suffix = parts.length > 1 ? parts.last : '';
    if (name.length <= 2) {
      return '${name.characters.first}***@$suffix';
    }
    return '${name.substring(0, 2)}***@$suffix';
  }

  final digits = value.replaceAll(RegExp(r'\D'), '');
  if (digits.length < 7) {
    return value;
  }
  return '${digits.substring(0, 3)}****${digits.substring(digits.length - 4)}';
}

class OnboardingIntroPage extends StatelessWidget {
  const OnboardingIntroPage({
    super.key,
    required this.onStart,
    this.isResume = false,
  });

  final VoidCallback onStart;
  final bool isResume;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppTheme.border),
                ),
                child: Text(
                  '下一步：备考初始化',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppTheme.success.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.check_rounded,
                  color: AppTheme.success,
                  size: 36,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                isResume ? '欢迎回来' : '登录成功',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                isResume
                    ? '已为你恢复上次的初始化进度，继续补完后就能生成你的学习系统。'
                    : '接下来用 1~2 分钟，帮你生成更适合你的备考方案。',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  height: 1.55,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppTheme.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _IntroPoint(text: '先了解考试时间、基础和可用时长'),
                    SizedBox(height: 12),
                    _IntroPoint(text: '再根据你的情况生成备考计划'),
                    SizedBox(height: 12),
                    _IntroPoint(text: '后续也可以在“我的”里继续调整'),
                  ],
                ),
              ),
              const Spacer(),
              AuthSubmitButton(
                label: isResume ? '继续填写' : '开始初始化',
                onPressed: onStart,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IntroPoint extends StatelessWidget {
  const _IntroPoint({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle_outline_rounded,
          color: AppTheme.success,
          size: 18,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppTheme.textPrimary,
              height: 1.45,
            ),
          ),
        ),
      ],
    );
  }
}
