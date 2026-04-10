import 'package:flutter/material.dart';

class castumText extends StatelessWidget {
  castumText({
    super.key,
    required this.text,
    required this.fontsize,
    this.textcolor,
    this.fontweight,
  });
  final String text;
  final double fontsize;
  final Color? textcolor;
  final FontWeight? fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: textcolor,
        fontWeight: fontweight,
      ),
    );
  }
}
