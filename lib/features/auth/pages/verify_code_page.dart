import 'package:flutter/material.dart';

import '../../../shared/theme/app_theme.dart';
import '../../../shared/widgets/top_banner_message.dart';
import '../../onboarding/pages/onboarding_intro_page.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_submit_button.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({
    super.key,
    required this.identity,
    required this.onBack,
    required this.onUsePassword,
    required this.onVerified,
  });

  final String identity;
  final VoidCallback onBack;
  final VoidCallback onUsePassword;
  final VoidCallback onVerified;

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;
  bool _isSubmitting = false;
  int _secondsRemaining = 59;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_controller.text.trim().length != 6) {
      setState(() {
        _errorText = '请输入 6 位验证码';
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
    widget.onVerified();
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
              title: '输入验证码',
              subtitle: '验证码已发送至 $maskedIdentity',
              onBack: widget.onBack,
            ),
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.sms_outlined,
                      color: AppTheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '如果没收到验证码，可以稍后重发，或改用密码登录。',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            if (_errorText != null) ...[
              const TopBannerMessage(message: '验证码错误，请重新输入'),
              const SizedBox(height: 16),
            ],
            Text(
              '验证码',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  if (_errorText != null && value.trim().length <= 6) {
                    _errorText = null;
                  }
                });
              },
              keyboardType: TextInputType.number,
              maxLength: 6,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: '请输入 6 位验证码',
                counterText: '',
                errorText: _errorText,
                filled: true,
                fillColor: AppTheme.surface,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
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
            const SizedBox(height: 24),
            AuthSubmitButton(
              label: '登录并继续',
              isLoading: _isSubmitting,
              onPressed: _controller.text.trim().length == 6 ? _handleSubmit : null,
            ),
            const SizedBox(height: 12),
            Center(
              child: TextButton(
                onPressed: _secondsRemaining == 0
                    ? () {
                        setState(() {
                          _secondsRemaining = 59;
                        });
                      }
                    : null,
                child: Text(
                  _secondsRemaining == 0 ? '重新发送' : '${_secondsRemaining}s 后重新发送',
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: widget.onUsePassword,
                child: const Text('改用密码登录'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
