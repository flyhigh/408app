import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFE78A5B);
  static const Color success = Color(0xFF5FAF88);
  static const Color warning = Color(0xFFF2B35D);
  static const Color danger = Color(0xFFD96C6C);
  static const Color aiPurple = Color(0xFF8B7AD1);
  static const Color pageBackground = Color(0xFFFFF8F4);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF2B211B);
  static const Color textSecondary = Color(0xFF7A685D);
  static const Color border = Color(0xFFEEDFD6);

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      surface: surface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: pageBackground,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        foregroundColor: textPrimary,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: border),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primary,
        unselectedItemColor: Colors.black45,
      ),
    );
  }
}
