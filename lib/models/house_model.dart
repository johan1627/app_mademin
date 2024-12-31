class Housemo {
  String? uuid;
  String? houseStreet;
  String? houseBlok;
  int? houseNumber;
  int? isActive;

  Housemo({
    this.uuid,
    this.houseStreet,
    this.houseBlok,
    this.houseNumber,
    this.isActive,
  });

  Housemo.fromJson(Map<String, dynamic> json) {
    uuid = json["uuid"];
    houseStreet = json["house_street"];
    houseBlok = json["house_blok"];
    houseNumber = json["house_number"];
    isActive = json["is_active"];
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'houseStreet': houseStreet,
      'houseBlok': houseBlok,
      'houseNumber': houseNumber,
      'isActive': isActive,
    };
  }
}
