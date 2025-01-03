import 'package:app_mademin/models/api_return_value.dart';
import 'package:app_mademin/models/trtransaction_model.dart';
import 'package:app_mademin/services/trtransaction_services.dart';
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

  //
  Future<ApiReturnValue<TrTransactionmo>> fetchByInvoiceId(
    String invoiceId,
  ) async {
    try {
      ApiReturnValue<TrTransactionmo> value =
          await TrTransactionServices().fetchByInvoiceId(invoiceId);

      return ApiReturnValue(
        value: value.value,
        statusCode: value.statusCode,
        message: value.message,
      );
    } catch (e) {
      return ApiReturnValue(
        statusCode: "500",
        message: "Terdapat kesalahan, silakan hubungi kami",
      );
    }
  }
}
