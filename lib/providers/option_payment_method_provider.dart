import 'package:app_mademin/models/api_return_value.dart';
import 'package:app_mademin/models/option_payment_method_model.dart';
import 'package:app_mademin/services/option_payment_method_services.dart';
import 'package:flutter/foundation.dart';

// Jangan lupa ditambahkan di main.dart
class OptionPaymentMethodProvider with ChangeNotifier {
  List<OptionPaymentMethodmo>? _value;
  List<OptionPaymentMethodmo> get value => _value!;

  set value(List<OptionPaymentMethodmo> value) {
    _value = value;
    notifyListeners();
  }

  String? mes = "";
  String get messages => mes!;

  set messages(String messages) {
    mes = messages;
    notifyListeners();
  }

  Future<ApiReturnValue<List<OptionPaymentMethodmo>>> optionPaymentMethod(
    String tenantId,
  ) async {
    try {
      ApiReturnValue<List<OptionPaymentMethodmo>> value =
          await OptionPaymentMethodServices().optionPaymentMethod(tenantId);

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
