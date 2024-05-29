class CartItem {
  final String image;
  final String name;
  final String price;

  CartItem({required this.image, required this.name, required this.price});
}

class CartManager {
  static final CartManager _instance = CartManager._internal();

  factory CartManager() {
    return _instance;
  }

  CartManager._internal();

  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    _cartItems.add(item);
  }
}
