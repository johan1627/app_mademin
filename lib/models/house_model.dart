import 'package:app_mademin/models/tenant_model.dart';

class Housemo {
  String? uuid;
  Tenantmo? tenantmo;
  String? houseStreet;
  String? houseBlok;
  int? houseNumber;
  String? houseAddress;
  int? isActive;

  Housemo({
    this.uuid,
    this.tenantmo,
    this.houseStreet,
    this.houseBlok,
    this.houseNumber,
    this.houseAddress,
    this.isActive,
  });

  Housemo.fromJson(Map<String, dynamic> json) {
    uuid = json["uuid"];
    tenantmo = Tenantmo.fromJson(json["tenant"]);
    houseStreet = json["house_street"];
    houseBlok = json["house_blok"];
    houseNumber = json["house_number"];
    houseAddress = json["house_address"];
    isActive = json["is_active"];
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'tenantmo': tenantmo,
      'houseStreet': houseStreet,
      'houseBlok': houseBlok,
      'houseNumber': houseNumber,
      'houseAddress': houseAddress,
      'isActive': isActive,
    };
  }
}
