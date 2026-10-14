import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import 'error_detail_page.dart';
import 'error_upload_page.dart';

class ErrorBookPage extends StatelessWidget {
  const ErrorBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.pageBackground,
        elevation: 0,
        leading: const BackButton(color: AppTheme.textPrimary),
        title: const Text('错题本', style: TextStyle(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list_rounded, color: AppTheme.textPrimary)),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.border.withValues(alpha: 0.8)),
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(Icons.search_rounded, color: AppTheme.textSecondary.withValues(alpha: 0.6), size: 20),
                    const SizedBox(width: 8),
                    Text('搜索错题摘要或标签...', style: TextStyle(color: AppTheme.textSecondary.withValues(alpha: 0.6), fontSize: 13)),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  _buildFilterChip('全部', isSelected: true),
                  _buildFilterChip('进程管理'),
                  _buildFilterChip('死锁专题'),
                  _buildFilterChip('待复习', color: AppTheme.warning),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildErrorCard(context),
                  );
                },
                childCount: 4,
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const ErrorUploadPage()));
        },
        backgroundColor: AppTheme.textPrimary,
        icon: const Icon(Icons.add_a_photo_outlined),
        label: const Text('录入错题', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false, Color? color}) {
    final effectiveColor = color ?? AppTheme.primary;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? effectiveColor : AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isSelected ? effectiveColor : AppTheme.border),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: isSelected ? Colors.white : AppTheme.textSecondary,
        ),
      ),
    );
  }

  Widget _buildErrorCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ErrorDetailPage()));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 2)),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppTheme.textSecondary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image_outlined, color: AppTheme.textSecondary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '判断题及概念：管程内的互斥同步实现机制',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.textPrimary),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: AppTheme.danger.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                        child: Text('核心概念模糊', style: TextStyle(fontSize: 10, color: AppTheme.danger.withValues(alpha: 0.8), fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(width: 8),
                      Text('OS · D1 复习', style: TextStyle(fontSize: 11, color: AppTheme.textSecondary.withValues(alpha: 0.8))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
