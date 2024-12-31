import 'package:app_mademin/models/api_return_value.dart';
import 'package:app_mademin/models/house_user_model.dart';
import 'package:app_mademin/services/house_user_services.dart';
import 'package:flutter/foundation.dart';

// Jangan lupa ditambahkan di main.dart
class HouseUserProvider with ChangeNotifier {
  List<HouseUsermo>? _value;
  List<HouseUsermo> get value => _value!;

  set value(List<HouseUsermo> value) {
    _value = value;
    notifyListeners();
  }

  String? mes = "";
  String get messages => mes!;

  set messages(String messages) {
    mes = messages;
    notifyListeners();
  }

  Future<ApiReturnValue<List<HouseUsermo>>> fetchByAuth(
    List<int> isActive,
  ) async {
    try {
      ApiReturnValue<List<HouseUsermo>> value =
          await HouseUserServices().fetchByAuth(isActive);

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
