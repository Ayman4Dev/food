import 'package:flutter/material.dart';
import 'package:food/features/checkout/widgets/payment_selection_indicator.dart';
import 'package:gap/gap.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.leading,
    required this.title,
    required this.backgroundColor,
    required this.indicatorColor,
    this.subtitle,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    this.titleStyle,
    this.subtitleStyle,
    this.borderRadius = 18,
    this.boxShadow = const [
      BoxShadow(
        color: Color(0x10000000),
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  });

  final bool isSelected;
  final VoidCallback onTap;
  final Widget leading;
  final String title;
  final String? subtitle;
  final Color backgroundColor;
  final Color indicatorColor;
  final EdgeInsetsGeometry padding;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double borderRadius;
  final List<BoxShadow> boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow,
        ),
        child: Row(
          children: [
            leading,
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        titleStyle ??
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2A2527),
                        ),
                  ),
                  if (subtitle != null) ...[
                    const Gap(3),
                    Text(
                      subtitle!,
                      style:
                          subtitleStyle ??
                          const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF8F8E93),
                          ),
                    ),
                  ],
                ],
              ),
            ),
            PaymentSelectionIndicator(
              isSelected: isSelected,
              activeColor: indicatorColor,
            ),
          ],
        ),
      ),
    );
  }
}
