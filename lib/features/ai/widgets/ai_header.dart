import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class AiHeader extends StatelessWidget {
  const AiHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.psychology_rounded, color: AppTheme.primary, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                'AI 教练',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.history_rounded),
                color: AppTheme.textPrimary,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.checklist_rtl_rounded),
                color: AppTheme.textPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
