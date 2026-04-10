import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/shared/logo.dart';

import 'core/constants/app_colors.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

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
