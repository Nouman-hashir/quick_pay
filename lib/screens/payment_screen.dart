import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/product_model.dart';
import 'success_screen.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/payment';
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(title: const Text("Confirm Payment")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/lottie/card.json', height: 200),
              Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Amount: \$${product.price.toStringAsFixed(2)}", style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pushReplacementNamed(context, SuccessScreen.routeName);
                  });
                },
                child: const Text("Pay with Stripe"),
              )
            ],
          ),
        ),
      ),
    );
  }
}