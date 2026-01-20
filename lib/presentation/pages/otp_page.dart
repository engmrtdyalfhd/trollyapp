// // lib/presentation/pages/otp_page.dart

// import 'dart:async';
// import 'package:flutter/material.dart';
// // import 'package:pinput/pinput.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pinput/pinput.dart';

// class OtpPage extends StatefulWidget {
//   const OtpPage({super.key});

//   @override
//   State<OtpPage> createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage> {
//   Timer? _timer;
//   int _start = 120; // 02:00 minutes
//   bool _canResend = false;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   void startTimer() {
//     setState(() {
//       _canResend = false;
//       _start = 120;
//     });
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_start == 0) {
//         setState(() {
//           _canResend = true;
//           timer.cancel();
//         });
//       } else {
//         setState(() {
//           _start--;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   String _formatTime(int seconds) {
//     final minutes = (seconds / 60).floor().toString().padLeft(2, '0');
//     final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
//     return '$minutes:$remainingSeconds';
//   }

//   @override
//   Widget build(BuildContext context) {
//     // تحديد أنماط مربعات الإدخال بناءً على مواصفات Figma
//     final defaultPinTheme = PinTheme(
//       width: 50,
//       height: 56,
//       textStyle: const TextStyle(
//         fontSize: 22,
//         fontFamily: 'Somar',
//         color: Color(0xFF1D327B),
//       ),
//       decoration: BoxDecoration(
//         color: Color(0xFFFFFFFF),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: const Color(0xFFE0E0E0)), // Gray/Gray-02
//       ),
//     );

//     return SingleChildScrollView( // لتجنب أي مشاكل عند ظهور لوحة المفاتيح
//       child: Padding(
//         padding: EdgeInsets.fromLTRB(28, 16, 28, MediaQuery.of(context).viewInsets.bottom + 32),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 40,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//             const SizedBox(height: 32),
//             const Text(
//               'من فضلك، ادخل كود التحقق المرسل\nلهاتفك المحمول لتأكيد حسابك',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontFamily: 'Somar',
//                 fontWeight: FontWeight.w500, // Medium
//                 color: Color(0xFF575757), // Primary/100
//               ),
//             ),
//             const SizedBox(height: 24),
            
//             if (!_canResend)
//               Text(
//                 'ينتهي الرمز خلال ${_formatTime(_start)}',
//                 style: const TextStyle(
//                   color: Color(0xFF828282), // Gray/25
//                   fontSize: 14,
//                   fontFamily: 'Somar',
//                 ),
//               )
//             else
//              GestureDetector(
//   onTap: startTimer, // إعادة تشغيل المؤقت عند النقر
//   behavior: HitTestBehavior.opaque, // لضمان التقاط النقرة في كل مساحة الـ Row
//   child: Row(
//     children: [
//       // 1. الأيقونة في الجهة اليسرى
//       SvgPicture.asset(
//         'assets/icons/Curved/refresh.svg',
//         width: 20,
//         height: 20,
//         colorFilter: const ColorFilter.mode(
//           Color(0xFF575757),
//           BlendMode.srcIn,
//         ),
//       ),

//       // 2. الـ Spacer يأخذ كل المساحة الفارغة في المنتصف
//       const Spacer(),

//       // 3. النص في الجهة اليمنى
//       const Text(
//         ' 00:00 انتهى الوقت. قم بإعادة الإرسال',
//         style: TextStyle(
//           color: Color(0xFF575757),
//           fontFamily: 'Somar',
//           fontWeight: FontWeight.w500,
//           fontSize: 14,
//         ),
//       ),
//     ],
//   ),
// ),

//             const SizedBox(height: 24),

//             Pinput(
//               length: 6,
//               defaultPinTheme: defaultPinTheme,
//               focusedPinTheme: defaultPinTheme.copyWith(
//                 decoration: defaultPinTheme.decoration!.copyWith(
//                   border: Border.all(color: const Color(0xFF1D327B)), // main color 1
//                 ),
//               ),
//               onCompleted: (pin) {
//                 // يمكنك وضع الكود الذي سيتم تنفيذه عند اكتمال الإدخال هنا
//               },
//             ),

//             const SizedBox(height: 32),

//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 50),
//                 backgroundColor: const Color(0xFF1D327B), // main color 1
//                 foregroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 'تأكيد الحساب',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontFamily: 'Somar',
//                   fontWeight: FontWeight.w700, // Bold
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trollyapp/presentation/pages/home_page.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;
  
  const OtpPage({super.key, required this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _pinController = TextEditingController();
  Timer? _timer;
  int _start = 120; // 02:00 minutes
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _canResend = false;
      _start = 120;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _canResend = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor().toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  void verifyOtp() {
    // في التطبيق الحقيقي، هنا ستتحقق من صحة الرمز مع الخادم
    if (_pinController.text == "123456") { // رمز افتراضي للاختبار
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كود التحقق غير صحيح')),
      );
    }
  }

  void resendOtp() {
    // في التطبيق الحقيقي، هنا ستطلب إعادة إرسال الرمز
    startTimer();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم إعادة إرسال الرمز')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        fontFamily: 'Somar',
        color: Color(0xFF1D327B),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1D327B)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              const Text(
                'تحقق من رقم هاتفك',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Somar',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1D327B),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'أرسلنا رمز التحقق إلى ${widget.phoneNumber}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Somar',
                  color: Color(0xFF828282),
                ),
              ),
              const SizedBox(height: 32),
              
              Pinput(
                controller: _pinController,
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: const Color(0xFF1D327B)),
                  ),
                ),
                onCompleted: (pin) => verifyOtp(),
              ),
              
              const SizedBox(height: 24),
              
              if (!_canResend)
                Text(
                  'ينتهي الرمز خلال ${_formatTime(_start)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF828282),
                    fontSize: 14,
                    fontFamily: 'Somar',
                  ),
                )
              else
                GestureDetector(
                  onTap: resendOtp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Curved/refresh.svg',
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF575757),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'إعادة إرسال الرمز',
                        style: TextStyle(
                          color: Color(0xFF575757),
                          fontFamily: 'Somar',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              
              const SizedBox(height: 32),
              
              ElevatedButton(
                onPressed: verifyOtp,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF1D327B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'تأكيد الحساب',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Somar',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}