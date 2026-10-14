import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/top_banner_message.dart';
import '../../onboarding/pages/onboarding_intro_page.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_submit_button.dart';

class PasswordLoginPage extends StatefulWidget {
  const PasswordLoginPage({
    super.key,
    required this.identity,
    required this.onBack,
    required this.onUseCode,
    required this.onLoggedIn,
  });

  final String identity;
  final VoidCallback onBack;
  final VoidCallback onUseCode;
  final VoidCallback onLoggedIn;

  @override
  State<PasswordLoginPage> createState() => _PasswordLoginPageState();
}

class _PasswordLoginPageState extends State<PasswordLoginPage> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;
  bool _obscureText = true;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_controller.text.trim().length < 6) {
      setState(() {
        _errorText = '密码至少需要 6 位';
      });
      return;
    }

    setState(() {
      _isSubmitting = true;
      _errorText = null;
    });
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted) {
      return;
    }
    setState(() {
      _isSubmitting = false;
    });
    widget.onLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    final maskedIdentity = maskIdentity(widget.identity);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          children: [
            AuthHeader(
              title: '输入密码',
              subtitle: '我们找到了你的账号，直接登录即可继续之前的进度',
              onBack: widget.onBack,
            ),
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.primary.withValues(alpha: 0.16)),
              ),
              child: Text(
                '如果你记得密码，可以直接回到之前的学习进度。',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textPrimary,
                  height: 1.45,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.border),
              ),
              child: Text(
                maskedIdentity,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_errorText != null) ...[
              const TopBannerMessage(message: '密码错误，请重新输入'),
              const SizedBox(height: 16),
            ],
            Text(
              '密码',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              obscureText: _obscureText,
              onChanged: (value) {
                setState(() {
                  if (_errorText != null && value.trim().isNotEmpty) {
                    _errorText = null;
                  }
                });
              },
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: '请输入密码',
                errorText: _errorText,
                filled: true,
                fillColor: AppTheme.surface,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: AppTheme.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: AppTheme.primary, width: 1.4),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: AppTheme.danger),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: AppTheme.danger, width: 1.4),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: const Text('忘记密码？'),
              ),
            ),
            const SizedBox(height: 10),
            AuthSubmitButton(
              label: '登录',
              isLoading: _isSubmitting,
              onPressed: _controller.text.trim().isNotEmpty ? _handleLogin : null,
            ),
            const SizedBox(height: 12),
            Center(
              child: TextButton(
                onPressed: widget.onUseCode,
                child: const Text('改用验证码登录'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
