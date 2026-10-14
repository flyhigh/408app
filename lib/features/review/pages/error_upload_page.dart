import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import 'error_ocr_processing_page.dart';

class ErrorUploadPage extends StatelessWidget {
  const ErrorUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Immersive camera feel
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text('对准错题题干', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Mock Camera Viewport
          Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.primary, width: 2),
                color: Colors.white.withValues(alpha: 0.05),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Text(
                      '假装这里是摄像头捕捉到的试卷图像\n\n请保证文字平齐且光线充足',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(width: 20, height: 20, decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppTheme.primary, width: 4), left: BorderSide(color: AppTheme.primary, width: 4)))),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(width: 20, height: 20, decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppTheme.primary, width: 4), right: BorderSide(color: AppTheme.primary, width: 4)))),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(width: 20, height: 20, decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primary, width: 4), left: BorderSide(color: AppTheme.primary, width: 4)))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(width: 20, height: 20, decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primary, width: 4), right: BorderSide(color: AppTheme.primary, width: 4)))),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.photo_library_outlined, color: Colors.white, size: 28),
                    ),
                    GestureDetector(
                      onTap: () {
                        // After tap to shoot, go to OCR process
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ErrorOcrProcessingPage()));
                      },
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: Center(
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.flash_off_rounded, color: Colors.white, size: 28),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text('拍照后将启动智能排版与考点识别', style: TextStyle(color: Colors.white54, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
