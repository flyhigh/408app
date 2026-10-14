import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '复习',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary,
                ),
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
                icon: const Icon(Icons.bar_chart_rounded),
                color: AppTheme.textPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
