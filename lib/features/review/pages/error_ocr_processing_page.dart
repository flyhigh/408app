import 'dart:async';
import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import 'error_ocr_confirm_page.dart';

class ErrorOcrProcessingPage extends StatefulWidget {
  const ErrorOcrProcessingPage({super.key});

  @override
  State<ErrorOcrProcessingPage> createState() => _ErrorOcrProcessingPageState();
}

class _ErrorOcrProcessingPageState extends State<ErrorOcrProcessingPage> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  int _step = 0;
  Timer? _timer;

  final List<String> _steps = [
    '正在上传原图...',
    '光学字符识别 (OCR) 中...',
    '正在清洗数据并排版...',
    'AI 正在抽取 408 大纲考点...',
    '即将完成...'
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);
    
    // Mock the asynchronous flow
    _timer = Timer.periodic(const Duration(seconds: 1, milliseconds: 500), (timer) {
      if (!mounted) return;
      if (_step < _steps.length - 1) {
        setState(() => _step++);
      } else {
        timer.cancel();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ErrorOcrConfirmPage()));
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.pageBackground,
        elevation: 0,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: Tween<double>(begin: 0.3, end: 1.0).animate(_pulseController),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.document_scanner_rounded, size: 48, color: AppTheme.primary),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              '后台引擎解算中',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800, color: AppTheme.textPrimary),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.border),
              ),
              child: Text(
                _steps[_step],
                style: const TextStyle(fontSize: 13, color: AppTheme.primary, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 80),
            TextButton.icon(
              onPressed: () {
                // Return to book, let it process in background (mock)
                Navigator.pop(context);
              },
              icon: const Icon(Icons.hourglass_bottom_rounded, size: 16),
              label: const Text('转入后台稍后再看'),
              style: TextButton.styleFrom(foregroundColor: AppTheme.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
