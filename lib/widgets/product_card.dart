import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../screens/payment_screen.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(product.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text("\$${product.price.toStringAsFixed(2)}", style: const TextStyle(fontSize: 16)),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, PaymentScreen.routeName, arguments: product);
          },
          child: const Text("Buy Now"),
        ),
      ),
    );
  }
}
