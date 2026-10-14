import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/top_banner_message.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_identity_input.dart';
import '../widgets/auth_submit_button.dart';

class AuthEntryPage extends StatefulWidget {
  const AuthEntryPage({
    super.key,
    required this.onBack,
    required this.onContinue,
    required this.onPasswordLogin,
  });

  final VoidCallback onBack;
  final ValueChanged<String> onContinue;
  final ValueChanged<String> onPasswordLogin;

  @override
  State<AuthEntryPage> createState() => _AuthEntryPageState();
}

class _AuthEntryPageState extends State<AuthEntryPage> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;
  bool _isSubmitting = false;
  bool _showNetworkError = false;

  bool get _isValid {
    final input = _controller.text.trim();
    return input.isNotEmpty && _validateIdentity(input) == null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleContinue() async {
    final error = _validateIdentity(_controller.text);
    setState(() {
      _errorText = error;
      _showNetworkError = false;
    });
    if (error != null) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted) {
      return;
    }
    setState(() {
      _isSubmitting = false;
    });
    widget.onContinue(_controller.text.trim());
  }

  void _handlePasswordLogin() {
    final error = _validateIdentity(_controller.text);
    setState(() {
      _errorText = error;
      _showNetworkError = false;
    });
    if (error != null) {
      return;
    }
    widget.onPasswordLogin(_controller.text.trim());
  }

  String? _validateIdentity(String value) {
    final input = value.trim();
    if (input.isEmpty) {
      return null;
    }
    if (input.contains('@')) {
      final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
      return emailPattern.hasMatch(input) ? null : '请输入正确的邮箱地址';
    }
    final digits = input.replaceAll(RegExp(r'\D'), '');
    return digits.length >= 11 ? null : '请输入正确的手机号';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(28, 48, 28, 32),
          children: [
            AuthHeader(
              title: '先登录，继续你的备考计划',
              subtitle: '我们会检查你是否已有账号，没有将自动创建',
              onBack: widget.onBack,
            ),
            const SizedBox(height: 48),
            if (_showNetworkError) ...[
              const TopBannerMessage(message: '当前网络异常，请稍后再试'),
              const SizedBox(height: 24),
            ],
            AuthIdentityInput(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _errorText = _validateIdentity(value);
                  _showNetworkError = false;
                });
              },
              errorText: _errorText,
            ),
            const SizedBox(height: 40),
            AuthSubmitButton(
              label: '继续',
              isLoading: _isSubmitting,
              onPressed: _isValid ? _handleContinue : null,
            ),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: _handlePasswordLogin,
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.textSecondary,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                child: const Text('使用密码登录'),
              ),
            ),
            const SizedBox(height: 48),
            Text(
              '继续即表示你同意《用户协议》和《隐私政策》\n未来的复习计划和进度将安全同步',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary.withValues(alpha: 0.6),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
