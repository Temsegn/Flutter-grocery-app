import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  final Box<ProductModel> _cartBox = Hive.box<ProductModel>('cart');

  List<ProductModel> get cartItems => _cartBox.values.toList();

  double get totalAmount {
    return cartItems.fold(0, (sum, product) => sum + product.price);
  }

  void addToCart(ProductModel product) {
    _cartBox.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    final key = _cartBox.keyAt(_cartBox.values.toList().indexOf(product));
    _cartBox.delete(key);
    notifyListeners();
  }
}
class FavoriteProvider with ChangeNotifier {
  final Box<ProductModel> _favoriteBox = Hive.box<ProductModel>('favorites');

  List<ProductModel> get favoriteItems => _favoriteBox.values.toList();

  bool isFavorite(ProductModel product) {
    return _favoriteBox.values.contains(product);
  }

  void addToFavorite(ProductModel product) {
    if (!_favoriteBox.values.contains(product)) {
      product.isFavorite = true; // Update isFavorite state
      _favoriteBox.add(product);
      notifyListeners();
    }
  }

  void removeFromFavorite(ProductModel product) {
    final key = _favoriteBox.keyAt(
      _favoriteBox.values.toList().indexOf(product),
    );
    product.isFavorite = false; // Update isFavorite state
    _favoriteBox.delete(key);
    notifyListeners();
  }
}