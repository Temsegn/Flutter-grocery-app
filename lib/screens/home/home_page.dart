import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/components/product_card.dart';
import 'package:grocery_app/components/product_detail.dart';
import 'package:grocery_app/screens/cart/cart_page.dart';
import 'package:grocery_app/screens/favorite/favorite_page.dart';
import 'package:grocery_app/screens/providerPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ProductModel> products = [
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
  ];

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
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePage()),
              );
            },
          ),
        ],
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
              onFavoriteTap: () {
                final favoriteProvider = Provider.of<FavoriteProvider>(
                  context,
                  listen: false,
                );
                if (favoriteProvider.favoriteItems.contains(product)) {
                  favoriteProvider.removeFromFavorite(product);
                } else {
                  favoriteProvider.addToFavorite(product);
                }
              },

              onAddToCartTap:
                  () => Provider.of<CartProvider>(
                    context,
                    listen: false,
                  ).addToCart(product),
            );
          },
        ),
      ),
    );
  }
}
