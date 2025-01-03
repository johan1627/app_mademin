import 'dart:convert';
import 'package:app_mademin/config/config.dart';
import 'package:app_mademin/models/api_return_value.dart';
import 'package:app_mademin/models/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<ApiReturnValue<bool>> signUp(
    String name,
    String email,
    String handphone,
  ) async {
    var url = "$baseUrl/auth/sign-up";

    Uri uri = Uri.parse(url);
    var headers = {
      'Content-Type': 'Application/json',
    };

    var body = jsonEncode({
      'name': name.toString(),
      'email': email.toString(),
      'handphone': handphone.toString(),
    });

    var response = await http.post(
      uri,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body)['data'];
      // Authmo model = Authmo.fromJson(data);

      // List<Apidevmoo> model = [];
      // for (var item in data) {
      //   model.add(Apidevmoo.fromJson(item));
      // }

      return ApiReturnValue(value: true, statusCode: "200");
    } else if (response.statusCode == 206) {
      var data = jsonDecode(response.body)['data'];
      //
      return ApiReturnValue(statusCode: "206", message: data["message"]);
    } else {
      return ApiReturnValue(
          statusCode: "500",
          message: "Terdapat kesalahan, silakan hubungi kami");
    }
  }

  Future<ApiReturnValue<Authmo>> signInWithPassword(
    String email,
    String password,
  ) async {
    var url = "$baseUrl/auth/sign-in";

    Uri uri = Uri.parse(url);
    var headers = {'Content-Type': 'Application/json'};
    var body = jsonEncode({
      'email': email.toString(),
      'password': password.toString(),
    });
    var response = await http.post(
      uri,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      Authmo model = Authmo.fromJson(data['user']);

      // List<Apidevmoo> model = [];
      // for (var item in data) {
      //   model.add(Apidevmoo.fromJson(item));
      // }
      // saved apitoken
      Authmo.apitoken = data["access_token"];

      return ApiReturnValue(statusCode: "200", value: model);
    } else if (response.statusCode == 401 || response.statusCode == 206) {
      //
      var data = jsonDecode(response.body)['data'];
      var message = data["message"];

      return ApiReturnValue(
          statusCode: response.statusCode.toString(), message: message);
    } else if (response.statusCode == 500) {
      //
      return ApiReturnValue(
          statusCode: "500",
          message: "Terdapat kesalahan, silakan hubungi kami");
    } else {
      return ApiReturnValue(
          statusCode: "500",
          message: "Terdapat kesalahan, silakan hubungi kami");
    }
  }

  Future<ApiReturnValue<Authmo>> fetchAuth() async {
    var url = "$baseUrl/auth/fetch-by-auth";

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
      Authmo model = Authmo.fromJson(data);

      // List<Apidevmoo> model = [];
      // for (var item in data) {
      //   model.add(Apidevmoo.fromJson(item));
      // }

      return ApiReturnValue(value: model, statusCode: "200");
    } else if (response.statusCode == 401) {
      //
      var data = jsonDecode(response.body)['data'];
      var message = data["message"];

      return ApiReturnValue(statusCode: "401", message: message);
    } else {
      return ApiReturnValue(
          statusCode: "500",
          message: "Terdapat kesalahan, silakan hubungi kami");
    }
  }

  Future<ApiReturnValue<bool>> deletedAccount(String email) async {
    var url = "$baseUrl/auth/deleted-account";

    Uri uri = Uri.parse(url);
    var headers = {
      'Content-Type': 'Application/json',
      "Authorization": "Bearer ${Authmo.apitoken}"
    };

    var body = jsonEncode({
      'email': email.toString(),
    });

    var response = await http.post(
      uri,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      // Authmo model = Authmo.fromJson(data);

      // List<Apidevmoo> model = [];
      // for (var item in data) {
      //   model.add(Apidevmoo.fromJson(item));
      // }

      return ApiReturnValue(value: data, statusCode: "200");
    } else if (response.statusCode == 206) {
      var data = jsonDecode(response.body)['data'];
      //
      return ApiReturnValue(statusCode: "206", message: data["message"]);
    } else {
      return ApiReturnValue(
          statusCode: "500",
          message: "Terdapat kesalahan, silakan hubungi kami");
    }
  }

  Future<ApiReturnValue<bool>> forgotPassword(
    String email,
  ) async {
    var url = "$baseUrl/auth/forgot-password";

    Uri uri = Uri.parse(url);
    var headers = {
      'Content-Type': 'Application/json',
      "Authorization": "Bearer ${Authmo.apitoken}"
    };

    var body = jsonEncode({
      'email': email.toString(),
    });

    var response = await http.post(
      uri,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body)['data'];
      // Authmo model = Authmo.fromJson(data);

      // List<Apidevmoo> model = [];
      // for (var item in data) {
      //   model.add(Apidevmoo.fromJson(item));
      // }

      return ApiReturnValue(value: true, statusCode: "200");
    } else if (response.statusCode == 206) {
      var data = jsonDecode(response.body)['data'];
      //
      return ApiReturnValue(statusCode: "206", message: data["message"]);
    } else {
      return ApiReturnValue(
          statusCode: "500",
          message: "Terdapat kesalahan, silakan hubungi kami");
    }
  }

  Future<ApiReturnValue<bool>> update(
    String uuid,
    String name,
    String handphone,
  ) async {
    var url = "$baseUrl/auth/update/$uuid";

    Uri uri = Uri.parse(url);
    var headers = {
      'Content-Type': 'Application/json',
      "Authorization": "Bearer ${Authmo.apitoken}"
    };

    var body = jsonEncode({
      'name': name.toString(),
      'handphone': handphone.toString(),
    });

    var response = await http.put(
      uri,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body)['data'];
      // Authmo model = Authmo.fromJson(data);

      // List<Apidevmoo> model = [];
      // for (var item in data) {
      //   model.add(Apidevmoo.fromJson(item));
      // }

      return ApiReturnValue(value: true, statusCode: "200");
    } else if (response.statusCode == 206) {
      var data = jsonDecode(response.body)['data'];
      //
      return ApiReturnValue(statusCode: "206", message: data["message"]);
    } else {
      return ApiReturnValue(
          statusCode: "500",
          message: "Terdapat kesalahan, silakan hubungi kami");
    }
  }

  Future<ApiReturnValue<bool>> signOut() async {
    var url = "$baseUrl/auth/sign-out";

    Uri uri = Uri.parse(url);
    var headers = {
      'Content-Type': 'Application/json',
      "Authorization": "Bearer ${Authmo.apitoken}"
    };

    var response = await http.post(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body)['data'];
      // Authmo model = Authmo.fromJson(data);

      // List<Apidevmoo> model = [];
      // for (var item in data) {
      //   model.add(Apidevmoo.fromJson(item));
      // }

      return ApiReturnValue(value: true, statusCode: "200");
    } else if (response.statusCode == 206) {
      var data = jsonDecode(response.body)['data'];
      //
      return ApiReturnValue(statusCode: "206", message: data["message"]);
    } else {
      return ApiReturnValue(
          statusCode: "500",
          message: "Terdapat kesalahan, silakan hubungi kami");
    }
  }
}
