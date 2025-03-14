import 'package:grocery_app/models/product_model.dart';
import 'package:hive/hive.dart';

void addSampleProducts() {
  final _productsBox = Hive.box<ProductModel>('products');

  if (_productsBox.isEmpty) {
    _productsBox.addAll([
      ProductModel(
        name: 'Mango',
        imageUrl: 'assets/images/Img_1.png',
        price: 1.99,
        isFavorite: false,
      ),
      ProductModel(
        name: 'Apple',
        imageUrl: 'assets/images/Img_1.png',
        price: 1.99,
        isFavorite: false,
      ),
      ProductModel(
        name: 'Lemon',
        imageUrl: 'assets/images/Img_1.png',
        price: 1.99,
        isFavorite: false,
      ),
      ProductModel(
        name: 'Banana',
        imageUrl: 'assets/images/Img_1.png',
        price: 1.99,
        isFavorite: false,
      ),
      ProductModel(
        name: 'Orange',
        imageUrl: 'assets/images/Img_1.png',
        price: 1.99,
        isFavorite: false,
      ),
      ProductModel(
        name: 'Grapes',
        imageUrl: 'assets/images/Img_1.png',
        price: 1.99,
        isFavorite: false,
      ),
      ProductModel(
        name: 'Pineapple',
        imageUrl: 'assets/images/Img_1.png',
        price: 1.99,
        isFavorite: false,
      ),
    ]);
  }
}