import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/components/product_card.dart';
import 'package:grocery_app/components/product_detail.dart';
import 'package:grocery_app/screens/providerPage.dart';
import 'package:provider/provider.dart';
import '../../database/sample_data.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  CartProvider Cart=CartProvider();
   FavoriteProvider Favorite=FavoriteProvider();   
  void navigateToProductDetail(BuildContext context, ProductModel product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductDetail(product: product)),
    );
  }

  void handleFavoriteTap(ProductModel product) {
    print('Favorite tapped for product: ${product.name}');
  }

  void handleAddToCartTap(ProductModel product) {
    print('Add to cart tapped for product: ${product.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75, // Adjust the aspect ratio as needed
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              product: product, 
              onTap: () => navigateToProductDetail(context, product),
              onFavoriteTap: () => () {
                          if (Favorite.favoriteItems.contains(product)) {
                            Favorite.removeFromFavorite(product); 
                          } else {
                            Favorite.addToFavorite(product);
                          }
                        },
              onAddToCartTap: () => context.read<CartProvider>().addToCart(product),
            );
          },
        ),
      ),
    );
  }
}