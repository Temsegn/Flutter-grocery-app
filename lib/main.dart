import 'package:flutter/material.dart';
import 'package:grocery_app/database/sample_data.dart';
import 'package:grocery_app/screens/home/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'models/product_model.dart'; 
import 'screens/providerPage.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProductModelAdapter());

  await Hive.openBox<ProductModel>('products');
  await Hive.openBox<ProductModel>('cart');
  await Hive.openBox<ProductModel>('favorites'); 
  addSampleProducts();
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
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
