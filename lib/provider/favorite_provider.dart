import 'package:flutter/cupertino.dart';
import 'package:practice_project/model/product_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favourites = [];
  List<Product> get favourite => _favourites;

  void toggleFavorite(Product product) {
    if (_favourites.contains(product)) {
      _favourites.remove(product);
    } else {
      _favourites.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favourites.contains(product);
    return isExist;
  }
}
