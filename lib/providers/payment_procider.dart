// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/models/product_model.dart';

class PaymentProvider extends ChangeNotifier {
  bool _isProcessing = false;
  Map<String, dynamic>? paymentIntent;

  bool get isProcessing => _isProcessing;

  void startProcessing() {
    _isProcessing = true;
    notifyListeners();
  }

  void stopProcessing() {
    _isProcessing = false;
    notifyListeners();
  }
Future<void> makePayment(ProductModel product, BuildContext context, VoidCallback onSuccess) async {
  startProcessing();

  try {
    final amount = (product.price * 100).toInt().toString();
    paymentIntent = await createPaymentIntent(amount, 'PKR');

    if (paymentIntent == null) {
      throw Exception("Payment intent is null");
    }

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent!['client_secret'],
        googlePay: const PaymentSheetGooglePay(
          testEnv: true,
          currencyCode: "PKR",
          merchantCountryCode: "PK",
        ),
        merchantDisplayName: 'QuickPay Demo',
      ),
    );

    await displayPaymentSheet(context);
    onSuccess(); 

  } catch (e) {
    debugPrint("Payment Exception: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: ${e.toString()}")),
    );
  }

  stopProcessing();
}


  Future<void> displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Payment Successful")),
      );
      paymentIntent = null;
    } on StripeException catch (e) {
      debugPrint("StripeException: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Payment Cancelled")),
      );
    } catch (e) {
      debugPrint("Display error: $e");
    }
  }

  Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': (int.parse(amount) * 100).toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      const String secretKey = 'sk_test_51RfWxv01dkjtTJoTb7rypPOkQ3CkjY3j6RTRv9C6UHYhbbD1XWuC46hlUurK9onEOe8HVTWm75EQPzHM5eduP0qR00E59yz1HG'; 

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      debugPrint('Payment Intent Response: ${response.body}');
      return jsonDecode(response.body);
    } catch (err) {
      debugPrint('Error creating PaymentIntent: $err');
      return null;
    }
  }
}
