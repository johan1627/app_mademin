import 'package:app_mademin/models/api_return_value.dart';
import 'package:app_mademin/models/payment_method_model.dart';
import 'package:app_mademin/services/payment_method_services.dart';
import 'package:flutter/foundation.dart';

// Jangan lupa ditambahkan di main.dart
class PaymentMethodProvider with ChangeNotifier {
  List<PaymentMethodmo>? _value;
  List<PaymentMethodmo> get value => _value!;

  set value(List<PaymentMethodmo> value) {
    _value = value;
    notifyListeners();
  }

  String? mes = "";
  String get messages => mes!;

  set messages(String messages) {
    mes = messages;
    notifyListeners();
  }

  Future<ApiReturnValue<List<PaymentMethodmo>>> optionPaymentMethod(
    String tenantId,
  ) async {
    try {
      ApiReturnValue<List<PaymentMethodmo>> value =
          await PaymentMethodServices().optionPaymentMethod(tenantId);

      return ApiReturnValue(
        value: value.value,
        statusCode: value.statusCode,
        message: value.message,
      );
    } catch (e) {
      return ApiReturnValue(
        statusCode: "500",
        message: "Aplikasi dalam pemeliharaan, coba beberapa saat lagi",
      );
    }
  }
}
