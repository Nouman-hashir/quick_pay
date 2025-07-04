
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/product_card.dart';
import '../models/product_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<ProductModel> products = [
    ProductModel(name: 'Pro Plan', price: 9.99),
    ProductModel(name: 'Gold Plan', price: 19.99),
    ProductModel(name: 'Premium Plan', price: 29.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("QuickPay Plans",style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),),
      backgroundColor: Colors.black,
      centerTitle: true,
      ),
      
      body: Column(
        children: [
          
          Lottie.asset('assets/lotties/payment.json', height: 240),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, i) => ProductCard(product: products[i]),
            ),
          ),
        ],
      ),
    );
  }
}