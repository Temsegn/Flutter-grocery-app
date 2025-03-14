import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';
class ProductDetail extends StatelessWidget {
  final ProductModel product;

  const ProductDetail({required this.product});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.green, // App bar color
        elevation: 0, // Remove shadow
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with Favorite Icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.imageUrl,
                    height: 300, // Fixed height for the image
                    width: double.infinity,
                    fit: BoxFit.cover, // Ensures the image fills the container
                  ),
                ),
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: IconButton(
                    onPressed: () {
                      // Handle Like action
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20), // Spacing

            // Product Name and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16), // Spacing

            // Add to Cart Button
            SizedBox(
              width: double.infinity, // Full-width button
              child: ElevatedButton(
                onPressed: () {
                  // Handle Add to Cart action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20), // Spacing

            // Product Description
            Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8), // Spacing
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}