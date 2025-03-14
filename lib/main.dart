import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'models/product_model.dart';
import 'screens/providerPage.dart';
void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(ProductModelAdapter());

  // Open boxes
  await Hive.openBox<ProductModel>('products'); // Box for products
  await Hive.openBox<ProductModel>('cart');    // Box for cart items
  await Hive.openBox<ProductModel>('favorites'); // Box for favorite items

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}