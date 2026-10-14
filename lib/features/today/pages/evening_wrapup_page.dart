import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class EveningWrapupPage extends StatefulWidget {
  const EveningWrapupPage({super.key});

  @override
  State<EveningWrapupPage> createState() => _EveningWrapupPageState();
}

class _EveningWrapupPageState extends State<EveningWrapupPage> {
  double _completionRatio = 0.8;
  int _difficulty = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.pageBackground,
        elevation: 0,
        leading: const BackButton(color: AppTheme.textPrimary),
        title: const Text('晚间复盘', style: TextStyle(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('结束一天前，让我们花 1 分钟校准一下你的复习时区。', style: TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('今日主观完成度', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
                const SizedBox(height: 8),
                Slider(
                  value: _completionRatio,
                  activeColor: AppTheme.primary,
                  inactiveColor: AppTheme.primary.withValues(alpha: 0.1),
                  onChanged: (v) => setState(() => _completionRatio = v),
                ),
                Center(child: Text('${(_completionRatio * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.w800, color: AppTheme.primary, fontSize: 18))),
                const Divider(height: 32),
                const Text('今日整体难度感受', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(5, (index) {
                    final isActive = index < _difficulty;
                    return InkWell(
                      onTap: () => setState(() => _difficulty = index + 1),
                      child: Icon(
                        isActive ? Icons.star_rounded : Icons.star_border_rounded,
                        color: isActive ? Colors.amber : AppTheme.border,
                        size: 36,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 12),
                Center(child: Text(_difficulty >= 4 ? '偏难' : (_difficulty <= 2 ? '轻松' : '适中'), style: const TextStyle(fontWeight: FontWeight.w600, color: AppTheme.textSecondary))),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.aiPurple.withValues(alpha: 0.1), AppTheme.aiPurple.withValues(alpha: 0.2)],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.aiPurple.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.auto_awesome_rounded, color: AppTheme.aiPurple, size: 20),
                    const SizedBox(width: 8),
                    const Text('AI 自动总结', style: TextStyle(fontWeight: FontWeight.w800, color: AppTheme.textPrimary, fontSize: 15)),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '系统检测到您今天在《OS - 死锁》章节上超出了预估时间 35 分钟。且您标记了整体偏难。\n\n我们将自动在明日日历中为您减轻 1 个不紧急复习任务，并为您推入重点死锁练习卡片。',
                  style: TextStyle(fontSize: 13, height: 1.5, color: AppTheme.textPrimary.withValues(alpha: 0.85)),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FilledButton(
            onPressed: () {
              // Submit feedback
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppTheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            child: const Text('确认，生成明日计划', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}
