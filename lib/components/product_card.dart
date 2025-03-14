import 'package:flutter/material.dart';
import 'package:grocery_app/models/product_model.dart';
import '../screens/providerPage.dart';
import 'package:provider/provider.dart';
class ProductCard extends StatefulWidget {
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
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: widget.onTap,
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
                  widget.product.imageUrl,
                  fit:
                      BoxFit
                          .cover, // Ensures the image covers the area without cutting
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
                    widget.product.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border,
                         color: Provider.of<FavoriteProvider>(context,listen: true).favoriteItems.contains(widget.product) ? Colors.red : Colors.grey,
                        ),
                        onPressed: widget.onFavoriteTap,
                      ),
                      // Smaller Add to Cart Button
                      SizedBox(
                        width: 80, // Set a fixed width for the button
                        height: 30, // Set a fixed height for the button
                        child: ElevatedButton(
                          onPressed: widget.onAddToCartTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),  
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            minimumSize: Size(
                              0,
                              0,
                            ),  
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
