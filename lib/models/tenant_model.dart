class Tenantmo {
  String? uuid;
  String? code;
  String? name;
  String? description;
  String? provinsiName;
  String? kotaName;
  String? kecamatanName;
  String? kelurahanName;
  String? expiredAt;

  Tenantmo({
    this.uuid,
    this.code,
    this.name,
    this.description,
    this.provinsiName,
    this.kotaName,
    this.kecamatanName,
    this.kelurahanName,
    this.expiredAt,
  });

  Tenantmo.fromJson(Map<String, dynamic> json) {
    uuid = json["uuid"];
    code = json["code"];
    name = json["name"];
    description = json["description"];
    provinsiName = json["provinsi_name"];
    kotaName = json["kota_name"];
    kecamatanName = json["kecamatan_name"];
    kelurahanName = json["kelurahan_name"];
    expiredAt = json["expired_at"];
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'code': code,
      'name': name,
      'description': description,
      'provinsiName': provinsiName,
      'kotaName': kotaName,
      'kecamatanName': kecamatanName,
      'kelurahanName': kelurahanName,
      'expiredAt': expiredAt,
    };
  }
}
