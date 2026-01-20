// lib/presentation/pages/onboarding_slide_one.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'onboarding_slide_two.dart'; // <-- استيراد الشريحة التالية

class OnboardingSlideOne extends StatefulWidget {
  const OnboardingSlideOne({super.key});

  @override
  State<OnboardingSlideOne> createState() => _OnboardingSlideOneState();
}

class _OnboardingSlideOneState extends State<OnboardingSlideOne> {
  @override
  void initState() {
    super.initState();
    // الانتقال التلقائي بعد 3 ثوانٍ
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(_createFadeRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D327B),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
        alignment: Alignment.bottomCenter, // لجعل المحتوى في الأسفل
        child: FadeInUp(
          duration: const Duration(milliseconds: 900),
          child: const Text(
            'استمتع\nبخصومات حصرية',
            style: TextStyle(fontFamily: 'Somar', fontWeight: FontWeight.w700, fontSize: 32, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // حركة مخصصة (تلاشي) للانتقال إلى الشريحة الثانية
  Route _createFadeRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) => const OnboardingSlideTwo(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}