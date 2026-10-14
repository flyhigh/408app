import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class TodaySubNav extends StatefulWidget {
  const TodaySubNav({super.key});

  @override
  State<TodaySubNav> createState() => _TodaySubNavState();
}

class _TodaySubNavState extends State<TodaySubNav> {
  int _selectedIndex = 0;
  final List<String> _tabs = ['今日', '本周', '积压'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: AppTheme.textSecondary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(3),
        child: Row(
          children: List.generate(_tabs.length, (index) {
            final isSelected = _selectedIndex == index;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? AppTheme.surface : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            )
                          ]
                        : null,
                  ),
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected ? AppTheme.textPrimary : AppTheme.textSecondary,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
