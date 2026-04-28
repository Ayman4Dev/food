import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({
    super.key,
    required this.title,
    required this.value,
    this.textStyle,
    this.valueStyle,
  });

  final String title;
  final String value;
  final TextStyle? textStyle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    final rowTextStyle =
        textStyle ??
        const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xFF7A7A7D),
        );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(title, style: rowTextStyle)),
        Text(value, style: valueStyle ?? rowTextStyle),
      ],
    );
  }
}
