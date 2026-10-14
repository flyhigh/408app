import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class ReschedulePage extends StatefulWidget {
  const ReschedulePage({super.key});

  @override
  State<ReschedulePage> createState() => _ReschedulePageState();
}

class _ReschedulePageState extends State<ReschedulePage> {
  String _selectedReason = '被打断';
  String _selectedStrategy = '保 MUST';

  final List<String> _reasons = ['被打断', '太难卡住了', '感觉疲惫', '计划有变'];
  final List<String> _strategies = ['保 MUST', '均匀顺延', '今日减负'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.pageBackground,
        elevation: 0,
        leading: const BackButton(color: AppTheme.textPrimary),
        title: const Text('突发重排', style: TextStyle(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.warning.withValues(alpha: 0.3)),
            ),
            child: const Row(
              children: [
                Icon(Icons.auto_awesome_rounded, color: AppTheme.warning),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '告诉我发生了什么，AI 调度系统将马上为你重新安排最合理的后续进度。',
                    style: TextStyle(fontSize: 13, color: AppTheme.textPrimary, height: 1.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('发生什么事了？', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _reasons.map((reason) {
              final isSelected = reason == _selectedReason;
              return ChoiceChip(
                label: Text(reason),
                selected: isSelected,
                onSelected: (val) {
                  if (val) setState(() => _selectedReason = reason);
                },
                selectedColor: AppTheme.primary.withValues(alpha: 0.15),
                labelStyle: TextStyle(color: isSelected ? AppTheme.primary : AppTheme.textSecondary, fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500),
                backgroundColor: AppTheme.surface,
                side: BorderSide(color: isSelected ? AppTheme.primary : AppTheme.border),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          const Text('重排偏好策略', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
          const SizedBox(height: 12),
          Column(
            children: _strategies.map((strategy) {
              final isSelected = strategy == _selectedStrategy;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  onTap: () => setState(() => _selectedStrategy = strategy),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: isSelected ? AppTheme.primary : AppTheme.border, width: isSelected ? 2 : 1),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                          color: isSelected ? AppTheme.primary : AppTheme.textSecondary,
                        ),
                        const SizedBox(width: 12),
                        Text(strategy, style: TextStyle(fontSize: 15, fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500, color: AppTheme.textPrimary)),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              const Text('今日剩余可用时间', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
              const Spacer(),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.border),
                    ),
                    child: const Text('1.5', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(width: 8),
                  const Text('小时', style: TextStyle(color: AppTheme.textSecondary)),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('已应用新计划')));
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppTheme.textPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            child: const Text('开始推演方案', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}
