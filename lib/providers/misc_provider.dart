import 'package:app_mademin/models/device_mode.dart';
import 'package:app_mademin/models/api_return_value.dart';
import 'package:app_mademin/services/misc_services.dart';
import 'package:flutter/foundation.dart';

// Jangan lupa ditambahkan di main.dart
class MiscProvider with ChangeNotifier {
  Devicemo? _value;
  Devicemo get value => _value!;

  set value(Devicemo value) {
    _value = value;
    notifyListeners();
  }

  String? mes = "";
  String get messages => mes!;

  set messages(String messages) {
    mes = messages;
    notifyListeners();
  }

  Future<ApiReturnValue<Devicemo>> fetch() async {
    try {
      ApiReturnValue<Devicemo> value = await MiscServices().fetch();

      _value = value.value;

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
