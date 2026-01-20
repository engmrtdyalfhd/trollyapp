import 'package:flutter/material.dart';
// import 'package:trollyapp2/presentation/pages/splash_page.dart';

import 'presentation/pages/splash_page.dart'; // <-- غيّر 'trolly' إلى اسم مشروعك

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // <--- مهم
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // لإزالة شريط "Debug" من أعلى يمين الشاشة
      debugShowCheckedModeBanner: false,
      
      title: 'Trolly App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
      // هنا نحدد الشاشة التي سيبدأ بها التطبيق
      home:  SplashPage(),
    );
  }
}