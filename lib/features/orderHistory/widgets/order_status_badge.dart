import 'package:flutter/material.dart';
import 'package:food/features/orderHistory/models/order_history_model.dart';

class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({super.key, required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final config = _statusUi(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: config.background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        config.label,
        style: TextStyle(
          color: config.textColor,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  _StatusUi _statusUi(OrderStatus value) {
    switch (value) {
      case OrderStatus.delivered:
        return const _StatusUi(
          label: 'Delivered',
          background: Color(0x1A1B8A42),
          textColor: Color(0xFF0E6A2E),
        );
      case OrderStatus.preparing:
        return const _StatusUi(
          label: 'Preparing',
          background: Color(0x1AF59E0B),
          textColor: Color(0xFF925D00),
        );
      case OrderStatus.cancelled:
        return const _StatusUi(
          label: 'Cancelled',
          background: Color(0x1ADC2626),
          textColor: Color(0xFFAF1D1D),
        );
    }
  }
}

class _StatusUi {
  const _StatusUi({
    required this.label,
    required this.background,
    required this.textColor,
  });

  final String label;
  final Color background;
  final Color textColor;
}
