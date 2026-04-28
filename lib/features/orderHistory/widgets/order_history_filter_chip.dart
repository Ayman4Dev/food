import 'package:flutter/material.dart';

class OrderHistoryFilterChip extends StatelessWidget {
  const OrderHistoryFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: isSelected,
      showCheckmark: false,
      side: BorderSide.none,
      selectedColor: const Color(0xFF025A22),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF4A4547),
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
      onSelected: (_) => onTap(),
    );
  }
}
