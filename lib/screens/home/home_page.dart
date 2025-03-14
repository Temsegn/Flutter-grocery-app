import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/components/product_card.dart';
import 'package:grocery_app/components/product_detail.dart';
import 'package:grocery_app/screens/cart/cart_page.dart';
import 'package:grocery_app/screens/favorite/favorite_page.dart';
import 'package:grocery_app/screens/providerPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box<ProductModel> _productsBox;

  @override
  void initState() {
    super.initState();
    _productsBox = Hive.box<ProductModel>('products');
  }

  void navigateToProductDetail(BuildContext context, ProductModel product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductDetail(product: product)),
    );
  }

  void handleFavoriteTap(ProductModel product) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    if (favoriteProvider.isFavorite(product)) {
      favoriteProvider.removeFromFavorite(product);
    } else {
      favoriteProvider.addToFavorite(product);
    }
  }

  void handleAddToCartTap(ProductModel product) {
    Provider.of<CartProvider>(context, listen: false).addToCart(product);
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
        child: StreamBuilder(
          stream: _productsBox.watch(),
          builder: (context, AsyncSnapshot<BoxEvent> snapshot) {
            final products = _productsBox.values.toList();
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onTap: () => navigateToProductDetail(context, product),
                  onFavoriteTap: () => handleFavoriteTap(product),
                  onAddToCartTap: () => handleAddToCartTap(product),
                );
              },
            );
          },
        ),
      ),
    );
  }
}