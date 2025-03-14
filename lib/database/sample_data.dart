import 'package:grocery_app/models/product_model.dart';
import 'package:hive/hive.dart';

List<ProductModel> products =
    Hive.box<ProductModel>('products').values.toList();
void addSampleProducts() {
  final _productsBox = Hive.box<ProductModel>('products');

  if (_productsBox.isEmpty) {
    _productsBox.addAll([
      ProductModel(
        name: 'Mango',
        imageUrl: 'assets/images/Img_1.png',
        price: 1.99, // Ensure this is a double
      ),
      ProductModel(
        name: 'Apple',
        imageUrl: 'assets/images/Img_1.png',

        price: 1.99, // Ensure this is a double
      ),
      ProductModel(
        name: 'Lemon',
        imageUrl: 'assets/images/Img_1.png',

        price: 1.99,
      ),
      ProductModel(
        name: 'Banana',
        imageUrl: 'assets/images/Img_1.png',

        price: 1.99,
      ),
      ProductModel(
        name: 'Orange',
        imageUrl: 'assets/images/Img_1.png',

        price: 1.99,
      ),
      ProductModel(
        name: 'Grapes',
        imageUrl: 'assets/images/Img_1.png',

        price: 1.99,
      ),
      ProductModel(
        name: 'Pineapple',
        imageUrl: 'assets/images/Img_1.png',

        price: 1.99,
      ),
    ]);
  }
}
