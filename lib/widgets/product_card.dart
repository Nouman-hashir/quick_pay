import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../screens/payment_screen.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
   
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
           color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey, width: 1),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 0, 0, 0),
        ]),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(product.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)),
        subtitle: Text("\$${product.price.toStringAsFixed(2)}", style: const TextStyle(fontSize: 16,color: Colors.white)),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, PaymentScreen.routeName, arguments: product);
          },
          child: const Text("Buy Now", style: TextStyle(color: Colors.white),)
        ),
      ),
    );
  }
}
