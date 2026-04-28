import 'package:flutter/material.dart';
import 'package:food/features/orderHistory/models/order_history_model.dart';
import 'package:food/features/orderHistory/widgets/order_history_card.dart';
import 'package:food/features/orderHistory/widgets/order_history_filter_chip.dart';
import 'package:gap/gap.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  OrderStatus? _selectedFilter;

  final List<OrderHistoryModel> _orders = [
    OrderHistoryModel(
      orderId: '#4125',
      placedAt: DateTime(2026, 4, 26),
      status: OrderStatus.delivered,
      totalPrice: 39.50,
      imagePath: 'assets/test/image 3.png',
      items: ['Classic Burger', 'Fries', 'Cola'],
    ),
    OrderHistoryModel(
      orderId: '#4120',
      placedAt: DateTime(2026, 4, 24),
      status: OrderStatus.preparing,
      totalPrice: 27.00,
      imagePath: 'assets/test/image 4.png',
      items: ['Chicken Burger', 'Onion Rings'],
    ),
    OrderHistoryModel(
      orderId: '#4102',
      placedAt: DateTime(2026, 4, 22),
      status: OrderStatus.cancelled,
      totalPrice: 18.99,
      imagePath: 'assets/test/image 5.png',
      items: ['Double Burger'],
    ),
    OrderHistoryModel(
      orderId: '#4088',
      placedAt: DateTime(2026, 4, 18),
      status: OrderStatus.delivered,
      totalPrice: 44.75,
      imagePath: 'assets/test/image 6.png',
      items: ['Combo Meal', 'Cheese Burger', 'Potato Wedges'],
    ),
  ];

  List<OrderHistoryModel> get _filteredOrders {
    if (_selectedFilter == null) {
      return _orders;
    }
    return _orders.where((order) => order.status == _selectedFilter).toList();
  }

  void _selectFilter(OrderStatus? status) {
    setState(() {
      _selectedFilter = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredOrders = _filteredOrders;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order History',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2A2527),
                ),
              ),
              const Gap(8),
              Text(
                '${filteredOrders.length} orders',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8F8E93),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    OrderHistoryFilterChip(
                      label: 'All',
                      isSelected: _selectedFilter == null,
                      onTap: () => _selectFilter(null),
                    ),
                    const Gap(8),
                    OrderHistoryFilterChip(
                      label: 'Delivered',
                      isSelected: _selectedFilter == OrderStatus.delivered,
                      onTap: () => _selectFilter(OrderStatus.delivered),
                    ),
                    const Gap(8),
                    OrderHistoryFilterChip(
                      label: 'Preparing',
                      isSelected: _selectedFilter == OrderStatus.preparing,
                      onTap: () => _selectFilter(OrderStatus.preparing),
                    ),
                    const Gap(8),
                    OrderHistoryFilterChip(
                      label: 'Cancelled',
                      isSelected: _selectedFilter == OrderStatus.cancelled,
                      onTap: () => _selectFilter(OrderStatus.cancelled),
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Expanded(
                child: filteredOrders.isEmpty
                    ? const _OrderHistoryEmptyState()
                    : ListView.separated(
                        itemCount: filteredOrders.length,
                        itemBuilder: (context, index) {
                          return OrderHistoryCard(order: filteredOrders[index]);
                        },
                        separatorBuilder: (_, __) => const Gap(12),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class _OrderHistoryEmptyState extends StatelessWidget {
  const _OrderHistoryEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.receipt_long_rounded, size: 42, color: Color(0xFFA5A4A8)),
          Gap(10),
          Text(
            'No orders found',
            style: TextStyle(
              color: Color(0xFF6E6B70),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
