// lib/presentation/pages/onboarding_slide_three.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'login_page.dart';// 1. قم باستيراد الشريحة الأولى

class OnboardingSlideThree extends StatefulWidget {
  const OnboardingSlideThree({super.key});

  @override
  State<OnboardingSlideThree> createState() => _OnboardingSlideThreeState();
}

class _OnboardingSlideThreeState extends State<OnboardingSlideThree> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        // 2. استخدم pushReplacement للانتقال إلى الشريحة الأولى
        Navigator.of(context).pushReplacement(
          // 3. هنا نحدد وجهة الانتقال لتكون الشريحة الأولى
          _createRouteBackToStart(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D327B),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
        alignment: Alignment.bottomCenter,
        child: FadeInUp(
          duration: const Duration(milliseconds: 900),
          child: const Text(
            'طرق دفع آمنة',
            style: TextStyle(
                fontFamily: 'Somar',
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // يمكنك استخدام حركة مخصصة للعودة إلى البداية
  Route _createRouteBackToStart() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // نستخدم حركة تلاشي للعودة، لتبدو كبداية جديدة
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}