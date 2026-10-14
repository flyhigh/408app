import 'package:flutter/material.dart';

import '../../features/ai/pages/ai_home_page.dart';
import '../../features/auth/pages/auth_entry_page.dart';
import '../../features/auth/pages/password_login_page.dart';
import '../../features/auth/pages/splash_page.dart';
import '../../features/auth/pages/verify_code_page.dart';
import '../../features/knowledge/pages/knowledge_home_page.dart';
import '../../features/onboarding/pages/onboarding_intro_page.dart';
import '../../features/profile/pages/profile_home_page.dart';
import '../../features/review/pages/review_home_page.dart';
import '../../features/today/pages/today_home_page.dart';
import '../../shared/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '408 备考助手',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const RootFlowPage(),
    );
  }
}

enum RootFlowStep {
  splash,
  authEntry,
  verifyCode,
  passwordLogin,
  onboardingIntro,
  appShell,
}

class RootFlowPage extends StatefulWidget {
  const RootFlowPage({super.key});

  @override
  State<RootFlowPage> createState() => _RootFlowPageState();
}

class _RootFlowPageState extends State<RootFlowPage> {
  RootFlowStep _step = RootFlowStep.splash;
  String _identity = '';

  void _goTo(RootFlowStep step) {
    setState(() {
      _step = step;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_step) {
      case RootFlowStep.splash:
        return SplashPage(
          onStart: () => _goTo(RootFlowStep.authEntry),
          onHasAccount: () => _goTo(RootFlowStep.authEntry),
        );
      case RootFlowStep.authEntry:
        return AuthEntryPage(
          onBack: () => _goTo(RootFlowStep.splash),
          onContinue: (identity) {
            setState(() {
              _identity = identity;
              _step = RootFlowStep.verifyCode;
            });
          },
          onPasswordLogin: (identity) {
            setState(() {
              _identity = identity;
              _step = RootFlowStep.passwordLogin;
            });
          },
        );
      case RootFlowStep.verifyCode:
        return VerifyCodePage(
          identity: _identity,
          onBack: () => _goTo(RootFlowStep.authEntry),
          onUsePassword: () => _goTo(RootFlowStep.passwordLogin),
          onVerified: () => _goTo(RootFlowStep.onboardingIntro),
        );
      case RootFlowStep.passwordLogin:
        return PasswordLoginPage(
          identity: _identity,
          onBack: () => _goTo(RootFlowStep.authEntry),
          onUseCode: () => _goTo(RootFlowStep.verifyCode),
          onLoggedIn: () => _goTo(RootFlowStep.onboardingIntro),
        );
      case RootFlowStep.onboardingIntro:
        return OnboardingIntroPage(
          onStart: () => _goTo(RootFlowStep.appShell),
        );
      case RootFlowStep.appShell:
        return const AppShell();
    }
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  static const _pages = <Widget>[
    TodayHomePage(),
    KnowledgeHomePage(),
    ReviewHomePage(),
    AiHomePage(),
    ProfileHomePage(),
  ];

  static const _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.today_outlined), activeIcon: Icon(Icons.today), label: '今日'),
    BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), activeIcon: Icon(Icons.menu_book), label: '知识库'),
    BottomNavigationBarItem(icon: Icon(Icons.refresh_outlined), activeIcon: Icon(Icons.refresh), label: '复习'),
    BottomNavigationBarItem(icon: Icon(Icons.auto_awesome_outlined), activeIcon: Icon(Icons.auto_awesome), label: 'AI'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: '我的'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _items,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
