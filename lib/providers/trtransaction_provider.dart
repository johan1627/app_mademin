import 'package:flutter/foundation.dart';

// Jangan lupa ditambahkan di main.dart
class TrTransactionProvider with ChangeNotifier {
  // from payment method
  String _channelCode = "";
  String get channelCode => _channelCode;

  set channelCode(String channelCode) {
    _channelCode = channelCode;
    notifyListeners();
  }

  // from payment method
  String _channelCodeImgPath = "";
  String get channelCodeImgPath => _channelCodeImgPath;

  set channelCodeImgPath(String channelCodeImgPath) {
    _channelCodeImgPath = channelCodeImgPath;
    notifyListeners();
  }
}
