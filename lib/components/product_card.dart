import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';
import '../screens/providerPage.dart';
import 'package:provider/provider.dart'; // Add this line

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onAddToCartTap;

  ProductCard({
    required this.product,
    required this.onTap,
    required this.onFavoriteTap,
    required this.onAddToCartTap,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.45, // Responsive width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(6)),
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<FavoriteProvider>(
                  builder: (context, favoriteProvider, child) {
                    final isFavorite = favoriteProvider.favoriteItems.contains(product);
                    return IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : null, 
                      ),
                      onPressed: () {
                        if (isFavorite) {
                          favoriteProvider.removeFromFavorite(product);
                        } else {
                          favoriteProvider.addToFavorite(product);
                        }
                      },
                    );
                  },
                ),
                      // Smaller Add to Cart Button
                      SizedBox(
                        width: 80, // Set a fixed width for the button
                        height: 30, // Set a fixed height for the button
                        child: ElevatedButton(
                          onPressed: onAddToCartTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ), // Minimal padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            minimumSize: Size(
                              0,
                              0,
                            ), // Remove default minimum size constraints
                          ),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontSize: 12, // Smaller font size
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
