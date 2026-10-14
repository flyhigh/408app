import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class KnowledgeHeader extends StatelessWidget {
  const KnowledgeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '知识库',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary,
                ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
            color: AppTheme.textPrimary,
          ),
        ],
      ),
    );
  }
}
