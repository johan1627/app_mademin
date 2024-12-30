class Peoplemo {
  String? uuid;
  String? name;
  String? identityNumber;
  String? email;
  String? handphone;
  String? placeOfBirth;
  String? dateOfBirth;
  int? gender;

  Peoplemo({
    this.uuid,
    this.name,
    this.identityNumber,
    this.email,
    this.handphone,
    this.placeOfBirth,
    this.dateOfBirth,
    this.gender,
  });

  Peoplemo.fromJson(Map<String, dynamic> json) {
    uuid = json["uuid"];
    name = json["name"];
    identityNumber = json["identity_number"];
    email = json["email"];
    handphone = json["handphone"];
    placeOfBirth = json["place_of_birth"];
    dateOfBirth = json["date_of_birth"];
    gender = json["gender"];
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'identityNumber': identityNumber,
      'email': email,
      'handphone': handphone,
      'placeOfBirth': placeOfBirth,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
    };
  }
}
