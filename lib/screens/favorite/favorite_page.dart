import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../providerPage.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: ListView.builder(
        itemCount: favoriteProvider.favoriteItems.length,
        itemBuilder: (context, index) {
          final product = favoriteProvider.favoriteItems[index];
          return ListTile(
            leading: Image.asset(
              product.imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                favoriteProvider.removeFromFavorite(product);
              },
            ),
          );
        },
      ),
    );
  }
}