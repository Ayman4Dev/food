import 'package:flutter/material.dart';
import 'package:food/core/constants/app_colors.dart';
import 'package:food/features/cart/data/cart_data.dart';
import 'package:food/features/cart/widgets/cart_empty_state.dart';
import 'package:food/features/cart/widgets/cart_header.dart';
import 'package:food/features/cart/widgets/cart_item.dart';
import 'package:food/features/checkout/views/CheckoutView.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final List<CartItemData> _items = getInitialCartItems();

  double get _subTotal {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  double get _deliveryFee => _items.isEmpty ? 0 : 1.50;

  double get _total => _subTotal + _deliveryFee;

  void _increaseQty(int index) {
    setState(() {
      _items[index].quantity++;
    });
  }

  void _decreaseQty(int index) {
    setState(() {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Column(
            children: [
              CartHeader(itemCount: _items.length),
              const Gap(14),
              Expanded(
                child: _items.isEmpty
                    ? const CartEmptyState()
                    : ListView.separated(
                        itemCount: _items.length,
                        separatorBuilder: (_, __) => const Gap(10),
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return CartItemTile(
                            item: item,
                            onAdd: () => _increaseQty(index),
                            onMinus: () => _decreaseQty(index),
                            onRemove: () => _removeItem(index),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 12,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Subtotal",
                  style: TextStyle(fontSize: 15, color: Color(0xFF666666)),
                ),
                Text(
                  "\$${_subTotal.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Gap(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Delivery fee",
                  style: TextStyle(fontSize: 15, color: Color(0xFF666666)),
                ),
                Text(
                  "\$${_deliveryFee.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text(
                  "\$${_total.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const Gap(12),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _items.isEmpty
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Checkoutview(),
                          ),
                        );
                      },
                child: const Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
