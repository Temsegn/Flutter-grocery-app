import 'package:grocery_app/models/product_model.dart';
import 'package:hive/hive.dart';

List<ProductModel> get products => Hive.box<ProductModel>('products').values.toList();

void addSampleProducts() {
  final _productsBox = Hive.box<ProductModel>('products');

  if (_productsBox.isEmpty) {
    _productsBox.addAll([
      ProductModel(
        
        name: 'Apple',
        price: 1.99,
        imageUrl: 'assets/images/img_1.png',
      ),
      ProductModel(
        
        name: 'Banana',
        price: 0.99,
        imageUrl: 'assets/images/img_1.png',
      ),
      ProductModel(
        
        name: 'Orange',
        price: 2.49,
        imageUrl: 'assets/images/img_1.png',
      ),
    ]);
  }
}