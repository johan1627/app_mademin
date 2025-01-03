import 'package:app_mademin/models/api_return_value.dart';
import 'package:app_mademin/models/trinvoice_model.dart';
import 'package:app_mademin/services/trinvoice_services.dart';
import 'package:flutter/foundation.dart';

// Jangan lupa ditambahkan di main.dart
class TrInvoiceProvider with ChangeNotifier {
  List<TrInvoicemo>? _value;
  List<TrInvoicemo> get value => _value!;

  set value(List<TrInvoicemo> value) {
    _value = value;
    notifyListeners();
  }

  String? mes = "";
  String get messages => mes!;

  set messages(String messages) {
    mes = messages;
    notifyListeners();
  }

  String _filtering = "Belum bayar";
  String get filtering => _filtering;

  set filtering(String filtering) {
    _filtering = filtering;
    notifyListeners();
  }

  Future<ApiReturnValue<List<TrInvoicemo>>> fetchByAuth(
      List<int> status, int page) async {
    try {
      ApiReturnValue<List<TrInvoicemo>> value =
          await TrInvoiceServices().fetchByAuth(status, page);

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
