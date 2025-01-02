import 'dart:convert';
import 'package:app_mademin/config/config.dart';
import 'package:app_mademin/models/api_return_value.dart';
import 'package:app_mademin/models/auth_model.dart';
import 'package:app_mademin/models/payment_method_model.dart';
import 'package:http/http.dart' as http;

class PaymentMethodServices {
  Future<ApiReturnValue<List<PaymentMethodmo>>> optionPaymentMethod(
    String tenantId,
  ) async {
    var url = "$baseUrl/gen-options/option-payment-method";

    Uri uri = Uri.parse(url);
    var headers = {
      'Content-Type': 'Application/json',
      "Authorization": "Bearer ${Authmo.apitoken}"
    };

    var body = jsonEncode({
      'tenant_id': tenantId.toString(),
    });

    var response = await http.post(
      uri,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      // Authmo model = Authmo.fromJson(data);

      List<PaymentMethodmo> model = [];
      for (var item in data) {
        model.add(PaymentMethodmo.fromJson(item));
      }

      return ApiReturnValue(value: model, statusCode: "200");
    } else if (response.statusCode == 206 || response.statusCode == 401) {
      var data = jsonDecode(response.body)['data'];
      //
      return ApiReturnValue(statusCode: "206", message: data["message"]);
    } else {
      return ApiReturnValue(
          statusCode: "500",
          message: "Aplikasi dalam pemeliharaan, coba beberapa saat lagi");
    }
  }
}
