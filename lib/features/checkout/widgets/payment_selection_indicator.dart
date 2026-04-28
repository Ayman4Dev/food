import 'package:flutter/material.dart';

class PaymentSelectionIndicator extends StatelessWidget {
  const PaymentSelectionIndicator({
    super.key,
    required this.isSelected,
    required this.activeColor,
  });

  final bool isSelected;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: isSelected ? activeColor : const Color(0xFFE1E1E4),
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activeColor,
                ),
              ),
            )
          : null,
    );
  }
}
