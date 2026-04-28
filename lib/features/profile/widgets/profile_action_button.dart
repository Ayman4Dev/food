import 'package:flutter/material.dart';

class ProfileActionButton extends StatelessWidget {
  const ProfileActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isPrimary = false,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isPrimary ? Colors.white : Colors.transparent;
    final foregroundColor = isPrimary
        ? const Color(0xFF1B5A31)
        : const Color(0xFFF3F9F5);
    final borderColor = isPrimary ? Colors.white : const Color(0xFFD4E9DB);

    return Expanded(
      child: SizedBox(
        height: 46,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            elevation: 0,
            backgroundColor: backgroundColor,
            side: BorderSide(color: borderColor, width: 1.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: foregroundColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (icon != null) ...[
                const SizedBox(width: 8),
                Icon(icon, color: foregroundColor, size: 18),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
