class PaymentTypemo {
  String? uuid;
  String? name;

  PaymentTypemo({
    this.uuid,
    this.name,
  });

  PaymentTypemo.fromJson(Map<String, dynamic> json) {
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
