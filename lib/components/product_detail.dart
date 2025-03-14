import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/screens/providerPage.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;

  const ProductDetail({required this.product});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.green,  
        elevation: 0,  
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.imageUrl,
                    height: 300, 
                    width: double.infinity,
                    fit: BoxFit.cover,  
                  ),
                ),
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: IconButton(
                    onPressed: () {
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

            SizedBox(height: 20),  

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

            SizedBox(height: 16),  

             SizedBox(
              width: double.infinity,  
              child: ElevatedButton(
                onPressed: () {
                     Provider.of<FavoriteProvider>(context,listen: false).addToFavorite(product);

                 },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,  
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

            SizedBox(height: 20),  

             Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),  
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