import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/features/auth/views/signup.dart';
import 'package:food/root.dart';
import 'package:food/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      title: 'Food APP',

      home: Root(),
    );
  }
}
