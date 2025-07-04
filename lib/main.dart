import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:quick_pay/providers/payment_procider.dart';
import 'package:quick_pay/screens/home_screen.dart';
import 'package:quick_pay/screens/payment_screen.dart';
import 'package:quick_pay/screens/success_screen.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51RfWxv01dkjtTJoTF4C9jTAGUBoPldQBE6QUq3c2ZmBE3SlzaUGtQH1Ky0B9I85dhjJA6TVl1aPzsjo3xKawwqck00FTsZqTpE'; 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QuickPay Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const HomeScreen(),
        routes: {
          PaymentScreen.routeName: (_) => const PaymentScreen(),
          SuccessScreen.routeName: (_) => const SuccessScreen(),
        },
      ),
    );
  }
}

