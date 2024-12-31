import 'package:app_mademin/models/people_model.dart';

class Authmo {
  int? id;
  String? uuid;
  String? name;
  String? email;
  Peoplemo? peoplemo;
  String? profilePhotoPath;
  DateTime? lastLoginAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  static String? apitoken;

  Authmo({
    this.id,
    this.uuid,
    this.name,
    this.email,
    this.peoplemo,
    this.profilePhotoPath,
    this.lastLoginAt,
    this.createdAt,
    this.updatedAt,
  });

  Authmo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    uuid = json["uuid"];
    name = json["name"];
    email = json["email"];
    peoplemo = Peoplemo.fromJson(json["people"]);
    profilePhotoPath = json["profile_photo_path"];
    lastLoginAt = DateTime.parse(json["lastlogin_at"]);
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
      'email': email,
      'peoplemo': peoplemo!.toJson(),
      'profilePhotoPath': profilePhotoPath,
      'lastLoginAt': lastLoginAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
