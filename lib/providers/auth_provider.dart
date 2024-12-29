import 'package:app_mademin/models/api_return_value.dart';
import 'package:app_mademin/services/auth_services.dart';
import 'package:app_mademin/models/auth_model.dart';
import 'package:flutter/foundation.dart';

// Jangan lupa ditambahkan di main.dart
class AuthProvider with ChangeNotifier {
  Authmo? _value;
  Authmo get value => _value!;

  set value(Authmo value) {
    _value = value;
    notifyListeners();
  }

  String? mes = "";
  String get messages => mes!;

  set messages(String messages) {
    mes = messages;
    notifyListeners();
  }

  Future<ApiReturnValue<bool>> signUp(
    String name,
    String email,
    String handphone,
  ) async {
    try {
      ApiReturnValue<bool> value =
          await AuthServices().signUp(name, email, handphone);

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

  Future<ApiReturnValue<Authmo>> signInWithPassword(
    String email,
    String password,
  ) async {
    try {
      ApiReturnValue<Authmo> value =
          await AuthServices().signInWithPassword(email, password);

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

  Future<ApiReturnValue<Authmo>> fetchAuth() async {
    try {
      ApiReturnValue<Authmo> value = await AuthServices().fetchAuth();

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

  Future<ApiReturnValue<bool>> deletedAccount(String email) async {
    try {
      ApiReturnValue<bool> value = await AuthServices().deletedAccount(email);

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

  Future<ApiReturnValue<bool>> forgotPassword(String email) async {
    try {
      ApiReturnValue<bool> value = await AuthServices().forgotPassword(email);

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
