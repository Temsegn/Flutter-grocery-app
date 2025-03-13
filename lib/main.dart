import 'package:flutter/material.dart';
import 'package:grocery_app/screens/providerPage.dart';
import 'screens/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/product_model.dart';
import 'database/sample_data.dart';
void main() async {
  await Hive.initFlutter(); // Initialize Hive for Flutter
  Hive.registerAdapter(ProductModelAdapter()); // Register the adapter
  await Hive.openBox<ProductModel>('cart'); // Box for cart items
  await Hive.openBox<ProductModel>('favorites'); // Box for favorite items
  await Hive.openBox<ProductModel>('products');
  addSampleProducts(); // Add sample products

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
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}
