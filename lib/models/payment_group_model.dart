class PaymentGroupmo {
  String? uuid;
  String? code;
  String? description;
  int? isActive;

  PaymentGroupmo({
    this.uuid,
    this.code,
    this.description,
    this.isActive,
  });

  PaymentGroupmo.fromJson(Map<String, dynamic> json) {
    uuid = json["uuid"];
    code = json["code"];
    description = json["description"];
    isActive = json["is_active"];
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'code': code,
      'description': description,
      'isActive': isActive,
    };
  }
}
