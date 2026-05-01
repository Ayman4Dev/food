import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/features/auth/views/login.dart';

import 'core/constants/app_colors.dart';

class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),

            SvgPicture.asset('assets/svg/Foodrush2.svg', width: 300),
            Spacer(),
            Image.asset("assets/splash/splashlogo.png"),
          ],
        ),
      ),
    );
  }
}
