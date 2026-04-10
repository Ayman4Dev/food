import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final double textsize;
  final Color fristcolor;
  final Color lastcolor;
  final  Function() fonction;
  

  const ButtonText({super.key, required this.text, required this.textsize, required this.fristcolor, required this.lastcolor, required this.fonction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
          fristcolor,
          lastcolor,
          ],
        ),
      ),
      child: MaterialButton(
        onPressed:fonction,
        child: Text(text, style: TextStyle(fontSize: textsize, color: Colors.white)),
      ),
    );
  }
}
