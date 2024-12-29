class Authmo {
  int? id;
  String? name;
  String? email;
  String? profilePhotoPath;
  DateTime? lastLoginAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  static String? apitoken;

  Authmo({
    this.id,
    this.name,
    this.email,
    this.profilePhotoPath,
    this.lastLoginAt,
    this.createdAt,
    this.updatedAt,
  });

  Authmo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    profilePhotoPath = json["profile_photo_path"];
    lastLoginAt = DateTime.parse(json["lastlogin_at"]);
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePhotoPath': profilePhotoPath,
      'lastLoginAt': lastLoginAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
