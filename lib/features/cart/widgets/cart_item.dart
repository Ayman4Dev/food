import 'package:flutter/material.dart';
import 'package:food/core/constants/app_colors.dart';
import 'package:food/features/cart/data/cart_data.dart';
import 'package:gap/gap.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.item,
    required this.onAdd,
    required this.onMinus,
    required this.onRemove,
  });

  final CartItemData item;
  final VoidCallback onAdd;
  final VoidCallback onMinus;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item.image,
              width: 82,
              height: 82,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(4),
                Text(
                  item.description,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const Gap(8),
                Text(
                  "\$${(item.price * item.quantity).toStringAsFixed(2)}",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F5EF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: onMinus,
                      icon: const Icon(Icons.remove),
                      visualDensity: VisualDensity.compact,
                    ),
                    Text(
                      "${item.quantity}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    IconButton(
                      onPressed: onAdd,
                      icon: const Icon(Icons.add),
                      color: AppColors.primary,
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: onRemove,
                child: const Text(
                  "Remove",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
