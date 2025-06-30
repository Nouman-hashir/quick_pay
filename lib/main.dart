import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_pay/providers/payment_procider.dart';
import 'package:quick_pay/screens/home_screen.dart';
import 'package:quick_pay/screens/payment_screen.dart';
import 'package:quick_pay/screens/success_screen.dart';

void main() {
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

