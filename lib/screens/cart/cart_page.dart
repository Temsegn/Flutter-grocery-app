import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../providerPage.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    // Group products by name and count their quantity
    final productCounts = <String, int>{};
    for (final product in cartProvider.cartItems) {
      productCounts[product.name] = (productCounts[product.name] ?? 0) + 1;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productCounts.length,
              itemBuilder: (context, index) {
                final productName = productCounts.keys.elementAt(index);
                final product = cartProvider.cartItems.firstWhere(
                  (p) => p.name == productName,
                );
                final quantity = productCounts[productName]!;

                return ListTile(
                  leading: Image.asset(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text('Quantity: $quantity'),
                  trailing: Text('\$${(product.price * quantity).toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}