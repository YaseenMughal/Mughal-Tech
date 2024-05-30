import 'package:flutter/material.dart';
import 'package:practice_project/model/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggleProduct(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQuantity(int index) => _cart[index].quantity++;
  decrementQuantity(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
      notifyListeners();
    }
  }

  getTotalPrice() {
    double total = 0.0;
    for (Product element in _cart) {
      total += (double.tryParse(element.price) ?? 0.0) * element.quantity;
      // total += element.price * element.quantity;

    }
    return double.parse(total.toStringAsFixed(2));
    // return total;
  }
}
