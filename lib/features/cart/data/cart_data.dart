class CartItemData {
  CartItemData({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  final String name;
  final String description;
  final double price;
  final String image;
  int quantity;

  CartItemData copyWith({
    String? name,
    String? description,
    double? price,
    String? image,
    int? quantity,
  }) {
    return CartItemData(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }
}

final List<CartItemData> cardData = [
  CartItemData(
    name: "Classic Burger",
    description: "Beef, cheese, lettuce",
    price: 6.50,
    image: "assets/test/image 6.png",
  ),
  CartItemData(
    name: "French Fries",
    description: "Crispy salted fries",
    price: 2.99,
    image: "assets/test/image 4.png",
  ),
  CartItemData(
    name: "Orange Juice",
    description: "Fresh and cold",
    price: 3.25,
    image: "assets/test/image 3.png",
  ),
];

List<CartItemData> getInitialCartItems() {
  return cardData.map((item) => item.copyWith()).toList();
}
