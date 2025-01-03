import 'package:app_mademin/models/house_model.dart';
import 'package:app_mademin/models/people_model.dart';

class HouseUsermo {
  String? uuid;
  Housemo? housemo;
  Peoplemo? peoplemo;
  int? isActive;

  HouseUsermo({
    this.uuid,
    this.housemo,
    this.peoplemo,
    this.isActive,
  });

  HouseUsermo.fromJson(Map<String, dynamic> json) {
    uuid = json["uuid"];
    housemo = Housemo.fromJson(json["house"]);
    peoplemo = Peoplemo.fromJson(json["people"]);
    isActive = json["is_active"];
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'housemo': housemo!.toJson(),
      'peoplemo': peoplemo!.toJson(),
      'isActive': isActive,
    };
  }
}
