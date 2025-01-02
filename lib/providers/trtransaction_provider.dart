import 'package:flutter/foundation.dart';

// Jangan lupa ditambahkan di main.dart
class TrTransactionProvider with ChangeNotifier {
  String _filtering = "Menunggu";
  String get filtering => _filtering;

  set filtering(String filtering) {
    _filtering = filtering;
    notifyListeners();
  }
}
