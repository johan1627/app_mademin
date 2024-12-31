class Statusmo {
  int? id;
  String? name;

  Statusmo({
    this.id,
    this.name,
  });

  Statusmo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
