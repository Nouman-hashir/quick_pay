// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quick_pay/providers/payment_procider.dart';
import '../models/product_model.dart';
import 'success_screen.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = '/payment';
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    final provider = Provider.of<PaymentProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Confirm Payment",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the color of the back button
        ),
        
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: provider.isProcessing
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lotties/payment.json', height: 150),
                    const SizedBox(height: 20),
                    const Text("Processing Payment...",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset('assets/lotties/card.json', height: 200),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Amount: \$${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        provider.makePayment(product, context, () {
                          Navigator.pushNamed(context, SuccessScreen.routeName);
                        });
                      },
                      child: const Text("Pay with Stripe",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
