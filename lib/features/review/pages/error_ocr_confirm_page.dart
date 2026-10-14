import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import 'error_detail_page.dart';

class ErrorOcrConfirmPage extends StatelessWidget {
  const ErrorOcrConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.pageBackground,
        elevation: 0,
        leading: const BackButton(color: AppTheme.textPrimary),
        title: const Text('结果复核确认', style: TextStyle(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.border),
            ),
            child: const Center(
              child: Text(
                '[ 原始截图切片 ]',
                style: TextStyle(color: AppTheme.textSecondary),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('机器已提取内容 (可点击修改)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.border),
            ),
            child: const Text(
              '管程中的信号量机制主要用于解决什么问题？\nA. 互斥\nB. 同步\nC. 死锁\nD. 饥饿',
              style: TextStyle(fontSize: 15, color: AppTheme.textPrimary, height: 1.5),
            ),
          ),
          const SizedBox(height: 24),
          const Text('所属知识点归类', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildDropdownMock('科目', '操作系统'),
              const SizedBox(width: 12),
              _buildDropdownMock('章节', '进程同步与互斥'),
            ],
          ),
          const SizedBox(height: 24),
          const Text('难度与错因', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildChip('概念模糊', true),
              _buildChip('计算错误', false),
              _buildChip('太灵活了', false),
              _buildChip('看错题意', false),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    side: BorderSide(color: AppTheme.border),
                  ),
                  child: const Text('重新拍摄', style: TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ErrorDetailPage()));
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('确认并生成精讲', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownMock(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary)),
            ),
            const Icon(Icons.arrow_drop_down_rounded, size: 20, color: AppTheme.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.warning.withValues(alpha: 0.15) : AppTheme.pageBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isSelected ? AppTheme.warning : AppTheme.border),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: isSelected ? AppTheme.warning : AppTheme.textSecondary,
        ),
      ),
    );
  }
}
