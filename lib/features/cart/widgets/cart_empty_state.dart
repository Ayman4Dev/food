import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartEmptyState extends StatelessWidget {
  const CartEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 70, color: Colors.grey),
          Gap(10),
          Text(
            "Your cart is empty",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Gap(6),
          Text(
            "Add items from home to start your order.",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
