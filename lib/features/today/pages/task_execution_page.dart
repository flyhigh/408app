import 'dart:async';
import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class TaskExecutionPage extends StatefulWidget {
  final String title;
  final String tag;

  const TaskExecutionPage({
    super.key,
    required this.title,
    required this.tag,
  });

  @override
  State<TaskExecutionPage> createState() => _TaskExecutionPageState();
}

class _TaskExecutionPageState extends State<TaskExecutionPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Timer? _timer;
  int _secondsElapsed = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _toggleTimer() {
    setState(() {
      if (_isRunning) {
        _timer?.cancel();
        _isRunning = false;
      } else {
        _isRunning = true;
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            _secondsElapsed++;
          });
        });
      }
    });
  }

  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.pageBackground,
        elevation: 0,
        leading: const BackButton(color: AppTheme.textPrimary),
        title: const Text('任务执行台', style: TextStyle(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded, color: AppTheme.textPrimary)),
        ],
      ),
      body: Column(
        children: [
          _buildInfoCard(),
          TabBar(
            controller: _tabController,
            labelColor: AppTheme.primary,
            unselectedLabelColor: AppTheme.textSecondary,
            indicatorColor: AppTheme.primary,
            tabs: const [
              Tab(text: '任务说明'),
              Tab(text: '知识点关联'),
              Tab(text: '我的笔记'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTaskBrief(),
                _buildPlaceholder('对应的知识节点图谱将在此渲染。'),
                _buildPlaceholder('在此可查看或编写笔记，或者上传错题记录。'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomActionBar(),
    );
  }

  Widget _buildInfoCard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppTheme.warning.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(6)),
                  child: Text(widget.tag, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppTheme.warning)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppTheme.textPrimary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('目标时长', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                    const SizedBox(height: 4),
                    Text('45 分钟', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.textPrimary.withValues(alpha: 0.8))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('实际耗时', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                    const SizedBox(height: 4),
                    Text(
                      _formatTime(_secondsElapsed),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: _isRunning ? AppTheme.primary : AppTheme.textPrimary,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskBrief() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('执行指南', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
        const SizedBox(height: 12),
        Text(
          '请先完整阅读王道教材第 3 章进程同步相关内容。\n\n重点突破：\n1. 信号量机制的底层定义\n2. 读者-写者问题的边界条件\n3. 管程的具体用法',
          style: TextStyle(fontSize: 14, color: AppTheme.textSecondary.withValues(alpha: 0.9), height: 1.6),
        ),
        const SizedBox(height: 24),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.psychology_rounded, size: 18),
          label: const Text('AI 帮我划重点'),
          style: OutlinedButton.styleFrom(foregroundColor: AppTheme.aiPurple),
        ),
      ],
    );
  }

  Widget _buildPlaceholder(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Text(text, textAlign: TextAlign.center, style: const TextStyle(color: AppTheme.textSecondary)),
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -2))],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _toggleTimer,
                    icon: Icon(_isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded),
                    label: Text(_isRunning ? '暂停计时' : '开始学习', style: const TextStyle(fontWeight: FontWeight.w700)),
                    style: FilledButton.styleFrom(
                      backgroundColor: _isRunning ? AppTheme.warning : AppTheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      // Logic to complete the task
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.check_circle_outline_rounded),
                    label: const Text('标记完成', style: TextStyle(fontWeight: FontWeight.w700)),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppTheme.success,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.help_outline_rounded, size: 18),
                  label: const Text('报告问题 (延迟/换任务)'),
                  style: TextButton.styleFrom(foregroundColor: AppTheme.textSecondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
