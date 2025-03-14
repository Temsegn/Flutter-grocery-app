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

  void addToFavorite(ProductModel product) {
    _favoriteBox.add(product);
    notifyListeners();
  }

  void removeFromFavorite(ProductModel product) {
    final key = _favoriteBox.keyAt(_favoriteBox.values.toList().indexOf(product));
    _favoriteBox.delete(key);
    notifyListeners();
  }
}