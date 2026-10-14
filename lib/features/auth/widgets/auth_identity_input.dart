import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';

class AuthIdentityInput extends StatelessWidget {
  const AuthIdentityInput({
    super.key,
    required this.controller,
    required this.onChanged,
    this.errorText,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String? errorText;

  bool get _looksLikePhone => !controller.text.contains('@');

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: _looksLikePhone
          ? TextInputType.phone
          : TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: AppTheme.textPrimary,
      ),
      decoration: InputDecoration(
        hintText: '输入手机号或邮箱',
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppTheme.textSecondary.withValues(alpha: 0.5),
        ),
        errorText: errorText,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(
          Icons.person_outline_rounded,
          color: AppTheme.textSecondary,
          size: 22,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppTheme.border.withValues(alpha: 0.8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppTheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppTheme.danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppTheme.danger, width: 1.5),
        ),
      ),
    );
  }
}
