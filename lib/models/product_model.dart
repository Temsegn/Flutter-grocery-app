import 'package:hive/hive.dart';

part 'product_model.g.dart'; // Generated file

@HiveType(typeId: 0) // Unique typeId for this class
class ProductModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final double price;

  ProductModel({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}