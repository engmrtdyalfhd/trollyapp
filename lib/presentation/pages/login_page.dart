// // lib/presentation/pages/login_page.dart

// import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F8F8),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Decorative pattern in the top-left
//             Positioned(
//               top: 0,
//               left: 0,
//               child: Image.asset('assets/images/login_pattern.png', width:100)
//             ),
            
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Column(
//                 children: [
//                   // This flexible container will hold the top content
//                   Expanded(
//                     flex: 2, // Gives more space to the top part
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset('assets/images/login_logo.png', height: 50),
//                         const SizedBox(height: 16),
//                         const Text(
//                           'أهلاً بك !',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontFamily: 'Somar', fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFF1D327B)),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           'قم بتسجيل الدخول',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontFamily: 'Somar', fontSize: 16, color: Color(0xFF828282)),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // This container will hold the bottom content
//                   Expanded(
//                     flex: 3, // Gives more space to the bottom part to push it down
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end, // Pushes content to the bottom
//                       children: [
//                         // Phone number input field
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
//                           child: Row(
//                             children: [
//                               const Text('+967', style: TextStyle(fontSize: 16, fontFamily: 'Somar')),
//                               const SizedBox(width: 8),
//                               Container(width: 1, height: 24, color: Colors.grey.shade300),
//                               const SizedBox(width: 8),
//                               const Expanded(child: TextField(keyboardType: TextInputType.phone, decoration: InputDecoration(hintText: 'رقم الموبايل', border: InputBorder.none))),
//                               const Icon(Icons.phone_iphone, color: Color(0xFF828282)),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 24),

//                         // Login buttons row
//                         Row(
//                           children: [
//                             Container(
//                               width: 60, height: 50,
//                               decoration: BoxDecoration(color: const Color(0xFF1D327B).withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
//                               child: const Icon(Icons.fingerprint, color: Color(0xFF1D327B), size: 30),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: ElevatedButton(
//                                 onPressed: () {},
//                                 style: ElevatedButton.styleFrom(
//                                   minimumSize: const Size(double.infinity, 50),
//                                   backgroundColor: const Color(0xFF1D327B),
//                                   foregroundColor: Colors.white,
//                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                                 ),
//                                 child: const Text('تسجيل الدخول', style: TextStyle(fontFamily: 'Somar', fontWeight: FontWeight.w700, fontSize: 16)),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 32),

//                         // "Or" separator
//                         Row(
//                           children: [
//                             const Expanded(child: Divider()),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               child: Text('أو', style: TextStyle(color: Colors.grey.shade500, fontFamily: 'Somar')),
//                             ),
//                             const Expanded(child: Divider()),
//                           ],
//                         ),
//                         const SizedBox(height: 32),

//                         // "Login as guest" button
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             'الدخول كزائر',
//                             style: TextStyle(fontFamily: 'Somar', fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF1D327B)),
//                           ),
//                         ),
//                         const SizedBox(height: 24), // Bottom padding
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// lib/presentation/pages/login_page.dart

// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import '../home/home_page.dart'; // استبدل بالمسار الصحيح لهوم باج

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _phoneController = TextEditingController();
//   final LocalAuthentication auth = LocalAuthentication();

//   // دالة تحقق من الرقم
//   bool _validatePhoneNumber(String phone) {
//     return phone.isNotEmpty && phone.length >= 9;
//   }

//   // دالة البصمة
//   Future<void> _loginWithFingerprint() async {
//     try {
//       bool authenticated = await auth.authenticate(
//         localizedReason: 'استخدم بصمتك لتسجيل الدخول',
//         options: const AuthenticationOptions(
//           biometricOnly: true,
//         ),
//       );
//       if (authenticated) {
//         _navigateToHome();
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('فشل التعرف على البصمة')),
//       );
//     }
//   }

//   void _loginWithPhone() {
//     if (_validatePhoneNumber(_phoneController.text)) {
//       _navigateToHome();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('الرجاء إدخال رقم صالح')),
//       );
//     }
//   }

//   void _loginAsGuest() {
//     _navigateToHome();
//   }

//   void _navigateToHome() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => const HomePage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F8F8),
//       body: SafeArea(
//         child: Stack(
//           children: [
          
      
          
 
//               // الصورة العلوية
//                         Positioned(
//               top: 0,
//               left: 0,
//               child: Image.asset('assets/images/login_pattern.png', width:100)
//             ),
//               const SizedBox(height: 24),
// Padding(     
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               // اللوجو والترحيب
//               child: Column(
//                 children: [
//                   Image.asset('assets/images/login_logo.png', height: 50),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'أهلاً بك !',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontFamily: 'Somar',
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFF1D327B)),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'قم بتسجيل الدخول',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontFamily: 'Somar', fontSize: 16, color: Color(0xFF828282)),
//                   ),
//                 ],
//               ),),
//               const SizedBox(height: 32),

//               // رقم الموبايل
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                     color: Colors.white, borderRadius: BorderRadius.circular(8)),
//                 child: Row(
//                   children: [
//                     const Text('+967', style: TextStyle(fontSize: 16, fontFamily: 'Somar')),
//                     const SizedBox(width: 8),
//                     Container(width: 1, height: 24, color: Colors.grey.shade300),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: TextField(
//                         controller: _phoneController,
//                         keyboardType: TextInputType.phone,
//                         decoration: const InputDecoration(
//                           hintText: 'رقم الموبايل',
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     const Icon(Icons.phone_iphone, color: Color(0xFF828282)),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // أزرار تسجيل الدخول
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: _loginWithFingerprint,
//                     child: Container(
//                       width: 60,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF1D327B).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Icon(Icons.fingerprint, color: Color(0xFF1D327B), size: 30),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: _loginWithPhone,
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(double.infinity, 50),
//                         backgroundColor: const Color(0xFF1D327B),
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                       ),
//                       child: const Text('تسجيل الدخول',
//                           style: TextStyle(
//                               fontFamily: 'Somar', fontWeight: FontWeight.w700, fontSize: 16)),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 32),

//               // فاصل "أو"
//               Row(
//                 children: [
//                   const Expanded(child: Divider()),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Text('أو',
//                         style: TextStyle(color: Colors.grey.shade500, fontFamily: 'Somar')),
//                   ),
//                   const Expanded(child: Divider()),
//                 ],
//               ),
//               const SizedBox(height: 32),

//               // دخول كزائر
//               TextButton(
//                 onPressed: _loginAsGuest,
//                 child: const Text(
//                   'الدخول كزائر',
//                   style: TextStyle(
//                       fontFamily: 'Somar',
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF1D327B)),
//                 ),
//               ),
//             ],
//           ),
//        ) 
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:trollyapp/presentation/home/home_page.dart';
// // import 'home_page.dart'; // صفحة الهوم بعد تسجيل الدخول

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController phoneController = TextEditingController();
//   final LocalAuthentication auth = LocalAuthentication();
//   String countryCode = '+967'; // القيمة الافتراضية لليمن

//   // دالة التحقق من صحة الرقم
//   bool validatePhone(String phone) {
//     return phone.isNotEmpty && phone.length >= 8;
//   }

//   // تسجيل الدخول بالرقم
//   void loginWithPhone() {
//     if (validatePhone(phoneController.text)) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('الرجاء إدخال رقم صالح')),
//       );
//     }
//   }

//   // تسجيل الدخول بالبصمة
//   Future<void> loginWithFingerprint() async {
//     bool authenticated = false;
//     try {
//       authenticated = await auth.authenticate(
//         localizedReason: 'الرجاء التحقق باستخدام بصمتك',
//         options: const AuthenticationOptions(biometricOnly: true),
//       );
//     } catch (e) {
//       debugPrint('خطأ في البصمة: $e');
//     }

//     if (authenticated) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()),
//       );
//     }
//   }

//   // الدخول كزائر
//   void loginAsGuest() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const HomePage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F8F8),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Decorative pattern
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Image.asset('assets/images/login_pattern.png', width: 100),
//               ),
//               const SizedBox(height: 32),

//               // شعار ونصوص الترحيب
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset('assets/images/login_logo.png', height: 50),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'أهلاً بك !',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Somar',
//                       fontSize: 24,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xFF1D327B),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'قم بتسجيل الدخول',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Somar',
//                       fontSize: 16,
//                       color: Color(0xFF828282),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 48),

//               // حقل رقم الموبايل مع country code
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: CountryCodePicker(
//                         onChanged: (code) {
//                           setState(() {
//                             countryCode = code.dialCode ?? '+967';
//                           });
//                         },
//                         initialSelection: 'YE',
//                         favorite: const ['+967', 'YE'],
//                         showCountryOnly: false,
//                         showFlag: true,
//                         showOnlyCountryWhenClosed: false,
//                         alignLeft: false,
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Container(width: 1, height: 24, color: Colors.grey.shade300),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: TextField(
//                         controller: phoneController,
//                         keyboardType: TextInputType.phone,
//                         decoration: const InputDecoration(
//                           hintText: 'رقم الموبايل',
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     const Icon(Icons.phone_iphone, color: Color(0xFF828282)),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // أزرار تسجيل الدخول
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: loginWithFingerprint,
//                     child: Container(
//                       width: 60,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF1D327B).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Icon(Icons.fingerprint, color: Color(0xFF1D327B), size: 30),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: loginWithPhone,
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(double.infinity, 50),
//                         backgroundColor: const Color(0xFF1D327B),
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text(
//                         'تسجيل الدخول',
//                         style: TextStyle(
//                           fontFamily: 'Somar',
//                           fontWeight: FontWeight.w700,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 32),

//               // separator "أو"
//               Row(
//                 children: [
//                   const Expanded(child: Divider()),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Text(
//                       'أو',
//                       style: TextStyle(color: Colors.grey.shade500, fontFamily: 'Somar'),
//                     ),
//                   ),
//                   const Expanded(child: Divider()),
//                 ],
//               ),
//               const SizedBox(height: 32),

//               // دخول كزائر
//               TextButton(
//                 onPressed: loginAsGuest,
//                 child: const Text(
//                   'الدخول كزائر',
//                   style: TextStyle(
//                     fontFamily: 'Somar',
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFF1D327B),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
///////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:trollyapp/presentation/home/home_page.dart';
// import 'package:trollyapp/presentation/pages/otp_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController phoneController = TextEditingController();
//   final LocalAuthentication auth = LocalAuthentication();
//   String completeNumber = '';

//   // دالة التحقق من صحة الرقم
//   bool validatePhone(String phone) {
//     return phone.isNotEmpty && phone.length >= 8;
//   }

//   // تسجيل الدخول بالرقم
//   // void loginWithPhone() {
//   //   if (validatePhone(phoneController.text)) {
//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(builder: (context) => const HomePage()),
//   //     );
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text('الرجاء إدخال رقم صالح')),
//   //     );
//   //   }
//   // }
//    void loginWithPhone() {
//     if (validatePhone(phoneController.text)) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const OtpPage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('الرجاء إدخال رقم صالح')),
//       );
//     }
//   }

//   // تسجيل الدخول بالبصمة
//   Future<void> loginWithFingerprint() async {
//     bool authenticated = false;
//     try {
//       authenticated = await auth.authenticate(
//         localizedReason: 'الرجاء التحقق باستخدام بصمتك',
//         options: const AuthenticationOptions(biometricOnly: true),
//       );
//     } catch (e) {
//       debugPrint('خطأ في البصمة: $e');
//     }

//     if (authenticated) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()),
//       );
//     }
//   }

//   // الدخول كزائر
//   void loginAsGuest() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const HomePage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F8F8),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Decorative pattern
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Image.asset('assets/images/login_pattern.png', width: 100),
//               ),
//               const SizedBox(height: 32),

//               // شعار ونصوص الترحيب
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset('assets/images/login_logo.png', height: 50),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'أهلاً بك !',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Somar',
//                       fontSize: 24,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xFF1D327B),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'قم بتسجيل الدخول',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Somar',
//                       fontSize: 16,
//                       color: Color(0xFF828282),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 48),

//               // حقل رقم الموبايل مع intl_phone_field
//               Expanded(
//                 child: IntlPhoneField(
//                   controller: phoneController,
//                   initialCountryCode: 'YE',
//                   decoration: const InputDecoration(
//                     labelText: 'رقم الموبايل',
//                     border: OutlineInputBorder(),
//                   ),
//                   onChanged: (phone) {
//                     completeNumber = phone.completeNumber;
//                     debugPrint('رقم كامل: $completeNumber');
//                   },
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // أزرار تسجيل الدخول
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: loginWithFingerprint,
//                     child: Container(
//                       width: 60,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF1D327B).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Icon(Icons.fingerprint, color: Color(0xFF1D327B), size: 30),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: loginWithPhone,
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(double.infinity, 50),
//                         backgroundColor: const Color(0xFF1D327B),
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text(
//                         'تسجيل الدخول',
//                         style: TextStyle(
//                           fontFamily: 'Somar',
//                           fontWeight: FontWeight.w700,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 32),

//               // separator "أو"
//               Row(
//                 children: [
//                   const Expanded(child: Divider()),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Text(
//                       'أو',
//                       style: TextStyle(color: Colors.grey.shade500, fontFamily: 'Somar'),
//                     ),
//                   ),
//                   const Expanded(child: Divider()),
//                 ],
//               ),
//               const SizedBox(height: 32),

//               // دخول كزائر
//               TextButton(
//                 onPressed: loginAsGuest,
//                 child: const Text(
//                   'الدخول كزائر',
//                   style: TextStyle(
//                     fontFamily: 'Somar',
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFF1D327B),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:c/local_auth.dart';
import 'package:local_auth/local_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trollyapp/presentation/pages/home_page.dart';
import 'package:trollyapp/presentation/pages/otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();
  String completeNumber = '';

  // دالة التحقق من صحة الرقم
  bool validatePhone(String phone) {
    return phone.isNotEmpty && phone.length >= 8;
  }

  // تسجيل الدخول بالرقم
  void loginWithPhone() {
    if (validatePhone(phoneController.text)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpPage(phoneNumber: completeNumber),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إدخال رقم صالح')),
      );
    }
  }

  // تسجيل الدخول بالبصمة
  Future<void> loginWithFingerprint() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'الرجاء التحقق باستخدام بصمتك',
        options:  AuthenticationOptions(biometricOnly: true),
      );
    } catch (e) {
      debugPrint('خطأ في البصمة: $e');
    }

    if (authenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage()),
      );
    }
  }

  // الدخول كزائر
  void loginAsGuest() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Decorative pattern
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/login_pattern.png', width: 100),
              ),
              const SizedBox(height: 32),

              // شعار ونصوص الترحيب
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/login_logo.png', height: 50),
                  const SizedBox(height: 16),
                  const Text(
                    'أهلاً بك !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Somar',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1D327B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'قم بتسجيل الدخول',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Somar',
                      fontSize: 16,
                      color: Color(0xFF828282),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // حقل رقم الموبايل مع intl_phone_field
              IntlPhoneField(
                controller: phoneController,
                initialCountryCode: 'YE',
                decoration: const InputDecoration(
                  labelText: 'رقم الموبايل',
                  border: OutlineInputBorder(),
                ),
                onChanged: (phone) {
                  completeNumber = phone.completeNumber;
                  debugPrint('رقم كامل: $completeNumber');
                },
              ),
              const SizedBox(height: 24),

              // أزرار تسجيل الدخول
              Row(
                children: [
                  GestureDetector(
                    onTap: loginWithFingerprint,
                    child: Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D327B).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.fingerprint, color: Color(0xFF1D327B), size: 30),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: loginWithPhone,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color(0xFF1D327B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontFamily: 'Somar',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // separator "أو"
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'أو',
                      style: TextStyle(color: Colors.grey.shade500, fontFamily: 'Somar'),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 32),

              // دخول كزائر
              TextButton(
                onPressed: loginAsGuest,
                child: const Text(
                  'الدخول كزائر',
                  style: TextStyle(
                    fontFamily: 'Somar',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1D327B),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}