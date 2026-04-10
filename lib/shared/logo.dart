import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  final double textsize;
  final Color fristcolor;
  final Color lastcolor;
  final String text;
  const LogoText({
    super.key,
    required this.textsize,
    required this.fristcolor,
    required this.lastcolor, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [fristcolor, lastcolor],
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
      },
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        style: TextStyle(
          fontSize: textsize,
          fontWeight: FontWeight.w400,
          fontFamily: 'prime',
        ),
      ),
    );
  }
}
