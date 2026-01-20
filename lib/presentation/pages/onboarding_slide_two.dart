// lib/presentation/pages/onboarding_slide_two.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'onboarding_slide_three.dart'; // <-- استيراد الشريحة التالية

class OnboardingSlideTwo extends StatefulWidget {
  const OnboardingSlideTwo({super.key});

  @override
  State<OnboardingSlideTwo> createState() => _OnboardingSlideTwoState();
}

class _OnboardingSlideTwoState extends State<OnboardingSlideTwo> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(_createScaleRoute());
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
            'توصيل\nسريع إلى باب منزلك',
            style: TextStyle(fontFamily: 'Somar', fontWeight: FontWeight.w700, fontSize: 32, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // حركة مخصصة (تكبير) للانتقال إلى الشريحة الثالثة
  Route _createScaleRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => const OnboardingSlideThree(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
    );
  }
}