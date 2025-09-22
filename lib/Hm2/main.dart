import 'package:flutter/material.dart';
import 'package:my_first_app/Hm2/intro.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Comparison System',
      theme: ThemeData(
        textTheme:
            GoogleFonts.promptTextTheme(), //ใช้ฟ้อนต์ Google ที่เคยโหลดมา
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey[100],
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: const IntroPage(), // เริ่มต้นที่หน้า Intro
    );
  }
}