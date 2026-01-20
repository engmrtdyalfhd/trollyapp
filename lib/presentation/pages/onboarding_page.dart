// lib/presentation/pages/onboarding_page.dart

import 'package:flutter/material.dart';
import 'dart:async';
import 'splash_page.dart'; // افترض أن هذه الصفحة موجودة
import 'onboarding_slide_one.dart';
import 'onboarding_slide_two.dart';
import 'onboarding_slide_three.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    const OnboardingSlideOne(),
    const OnboardingSlideTwo(),
    const OnboardingSlideThree(),
  ];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      int currentPage = _pageController.page!.round();
      if (currentPage < _pages.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 700),
          curve: Curves.ease,
        );
      } else {
        _navigateToLogin();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToLogin() {
    _timer?.cancel();
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SplashPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D327B),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
    );
  }
}