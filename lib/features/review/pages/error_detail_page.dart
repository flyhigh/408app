import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class ErrorDetailPage extends StatelessWidget {
  const ErrorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.pageBackground,
        elevation: 0,
        leading: BackButton(onPressed: () => Navigator.popUntil(context, (route) => route.isFirst)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.star_border_rounded, color: AppTheme.textPrimary)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded, color: AppTheme.textPrimary)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: AppTheme.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
                child: const Text('OS 进程管理', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppTheme.primary)),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: AppTheme.danger.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
                child: Text('核心概念模糊', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppTheme.danger.withValues(alpha: 0.9))),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '管程中的信号量机制主要用于解决什么问题？\nA. 互斥\nB. 同步\nC. 死锁\nD. 饥饿',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.textPrimary, height: 1.5),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.03),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.close_rounded, color: AppTheme.danger, size: 16),
                SizedBox(width: 8),
                Text('我的错误答案：A. 互斥', style: TextStyle(color: AppTheme.danger, fontSize: 13, fontWeight: FontWeight.w600)),
                Spacer(),
                Text('正确答案：B', style: TextStyle(color: AppTheme.success, fontSize: 13, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text('AI 名师精讲', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppTheme.textPrimary)),
          const SizedBox(height: 16),
          _buildAnalysisBlock('你错在哪里？', '你误把管程本身的定义和**管程中的条件变量/信号量**混淆了。管程本身已经提供了互斥特性，不需要信号量去实现互斥，而是通过信号量去唤醒进程（同步）。', AppTheme.danger),
          _buildAnalysisBlock('正确思路', '梳理知识树：管程(Monitor)的初衷是为了把复杂的 P/V 互斥封装在内部。但在管程执行时，如果某个条件不满足被阻塞，怎么换人？这就需要同步进制（条件变量和 wait/signal 操作）。', AppTheme.success),
          _buildAnalysisBlock('下次怎么避雷', '遇到“管程的内部变量”题目，直接将它等价翻译为【解决同步条件等待】，互斥永远是由系统保证的。', AppTheme.primary),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FilledButton(
             onPressed: () {
               Navigator.popUntil(context, (route) => route.isFirst);
             },
             style: FilledButton.styleFrom(
               backgroundColor: AppTheme.textPrimary,
               padding: const EdgeInsets.symmetric(vertical: 16),
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
             ),
             child: const Text('标记为我已领悟', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }

  Widget _buildAnalysisBlock(String title, String content, Color accentColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border(left: BorderSide(color: accentColor, width: 4)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_rounded, size: 16, color: accentColor),
              const SizedBox(width: 8),
              Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: accentColor)),
            ],
          ),
          const SizedBox(height: 12),
          Text(content, style: TextStyle(fontSize: 14, color: AppTheme.textPrimary.withValues(alpha: 0.85), height: 1.6)),
        ],
      ),
    );
  }
}
