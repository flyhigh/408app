import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../pages/error_book_page.dart';
import '../pages/error_upload_page.dart';

class ReviewWrongQuestionCard extends StatelessWidget {
  const ReviewWrongQuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.warning.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.warning.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.warning.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.edit_document, color: AppTheme.warning, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '错题本',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 12, color: AppTheme.textSecondary.withValues(alpha: 0.8)),
                      children: const [
                        TextSpan(text: '12 题', style: TextStyle(fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
                        TextSpan(text: ' 待整理，'),
                        TextSpan(text: '5 题', style: TextStyle(fontWeight: FontWeight.w600, color: AppTheme.warning)),
                        TextSpan(text: ' 待复习'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                FilledButton.tonal(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ErrorBookPage()));
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppTheme.warning.withValues(alpha: 0.15),
                    foregroundColor: AppTheme.warning,
                    minimumSize: const Size(80, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('查看', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                ),
                const SizedBox(height: 6),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ErrorUploadPage()));
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(80, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor: AppTheme.textSecondary,
                  ),
                  child: const Text('录入', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
