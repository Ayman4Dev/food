enum OrderStatus { delivered, preparing, cancelled }

class OrderHistoryModel {
  OrderHistoryModel({
    required this.orderId,
    required this.placedAt,
    required this.status,
    required this.totalPrice,
    required this.imagePath,
    required this.items,
  });

  final String orderId;
  final DateTime placedAt;
  final OrderStatus status;
  final double totalPrice;
  final String imagePath;
  final List<String> items;
}
