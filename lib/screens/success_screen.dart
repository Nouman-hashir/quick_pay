import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  static const routeName = '/success';
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/success.json', height: 250),
            const Text(
              "Payment Successful!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              child: const Text("Go to Home"),
            )
          ],
        ),
      ),
    );
  }
}
