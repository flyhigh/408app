import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../pages/reschedule_page.dart';
import '../pages/task_execution_page.dart';

class TodayStickyCta extends StatelessWidget {
  const TodayStickyCta({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const TaskExecutionPage(title: 'OS - 进程同步基础', tag: 'MUST')));
                },
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.textPrimary, // Stark contrast for main action
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: const Text(
                  '开始第一个任务',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ReschedulePage()));
                },
                icon: const Icon(Icons.bolt_rounded, size: 18),
                label: const Text('重排', style: TextStyle(fontWeight: FontWeight.w700)),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  foregroundColor: AppTheme.danger,
                  side: BorderSide(color: AppTheme.danger.withValues(alpha: 0.4)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
