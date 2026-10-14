import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class ProfileMenuListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const ProfileMenuListItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: AppTheme.textSecondary, size: 22),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 11,
                          color: AppTheme.textSecondary.withValues(alpha: 0.8),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: AppTheme.textSecondary.withValues(alpha: 0.5)),
            ],
          ),
        ),
      ),
    );
  }
}
