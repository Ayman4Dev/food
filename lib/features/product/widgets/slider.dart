import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProdactSloder extends StatefulWidget {
  const ProdactSloder({super.key, required this.text, required this.value});
  final String text;
  final double value;

  @override
  State<ProdactSloder> createState() => _ProdactSloderState();
}

class _ProdactSloderState extends State<ProdactSloder> {
  late double sliderValue;

  @override
  void initState() {
    sliderValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.text, textAlign: TextAlign.center),
        Row(
          children: [
            Slider(
              max: 1.0,
              min: 0.0,
              value: sliderValue,
              onChanged: (v) {
                setState(() {
                  sliderValue = v;
                });
              },
            ),
            Text("${(sliderValue * 100).round()}%"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("0%😋"), Gap(90), Text("100% 🔥🌶️")],
        ),
      ],
    );
  }
}
