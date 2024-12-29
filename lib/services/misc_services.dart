import 'dart:convert';
import 'package:app_mademin/config/config.dart';
import 'package:app_mademin/models/api_return_value.dart';
import 'package:app_mademin/models/auth_model.dart';
import 'package:app_mademin/models/device_mode.dart';
import 'package:http/http.dart' as http;

class MiscServices {
  Future<ApiReturnValue<Devicemo>> fetch() async {
    var url = "$baseUrl/device/fetch";

    Uri uri = Uri.parse(url);
    var headers = {
      'Content-Type': 'Application/json',
      "Authorization": "Bearer ${Authmo.apitoken}"
    };

    var response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      Devicemo model = Devicemo.fromJson(data);

      // List<OutletCategorymo> model = [];
      // for (var item in data) {
      //   model.add(Devicemo.fromJson(item));
      // }

      return ApiReturnValue(statusCode: "200", value: model);
    } else if (response.statusCode == 206) {
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
