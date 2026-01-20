// lib/presentation/pages/splash_page.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'onboarding_slide_one.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _startAnimation = false;

  @override
  void initState() {
    super.initState();
    _startTransition();
  }

  void _startTransition() async {
    // الانتظار للحظة قبل بدء كل شيء
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      // بدء حركة الشعار العلوي والشكل السفلي
      setState(() {
        _startAnimation = true;
      });
      // بدء الانتقال للصفحة التالية في نفس اللحظة
      Navigator.of(context).pushReplacement(_createCustomRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const logoHeight = 68.0;
    const patternHeight = 200.0; // ارتفاع تقريبي للشكل السفلي لتحريكه خارج الشاشة

    return Scaffold(
      backgroundColor: const Color(0xFF1D327B),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. تغليف الشكل السفلي بـ AnimatedPositioned لجعله متحركًا
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            // قبل الحركة: يكون في الأسفل (bottom: 0)
            // بعد الحركة: يتحرك للأسفل خارج الشاشة (bottom: -patternHeight)
            bottom: _startAnimation ? -patternHeight : 0,
            child: Image.asset(
              'assets/images/splash_pattern.png',
              fit: BoxFit.contain,
              width: 399,
            ),
          ),
          
          // الشعار العلوي (يبقى كما هو)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            top: _startAnimation
                ? 100.0 // <--- هذا هو التعديل الرئيسي
                : (screenSize.height / 2) - (logoHeight / 2),
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: _startAnimation ? 0.0 : 1.0,
              child: Image.asset('assets/images/logo.png',
                  width: 226, height: logoHeight),
            ),
          ),
        ],
      ),
    );
  }

  // 2. تغيير حركة الانتقال إلى تلاشي (Fade)
  Route _createCustomRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1200), // نعطي وقتا أطول قليلا للتلاشي
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OnboardingSlideOne(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // نجعل الصفحة الجديدة تظهر تدريجياً
        return FadeTransition(
          // نربط شفافية الصفحة الجديدة بتقدم حركة الانتقال
          opacity: animation,
          child: child,
        );
      },
    );
  }
}