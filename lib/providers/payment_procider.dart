import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  bool _isProcessing = false;

  bool get isProcessing => _isProcessing;

  void startProcessing() {
    _isProcessing = true;
    notifyListeners();
  }

  void stopProcessing() {
    _isProcessing = false;
    notifyListeners();
  }
}
