class PaymentMethodmo {
  String? uuid;
  String? name;

  PaymentMethodmo({
    this.uuid,
    this.name,
  });

  PaymentMethodmo.fromJson(Map<String, dynamic> json) {
    uuid = json["uuid"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
    };
  }
}
