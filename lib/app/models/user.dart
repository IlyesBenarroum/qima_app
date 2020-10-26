import 'dart:convert';
// import 'models/country_model.dart';

class User {
  int id;
  String name;
  String osId;
  String gender;
  String email;
  String avatar;
  String phone;
  String countryCode;
  // Country country;
  User({
    this.id,
    this.name,
    this.osId,
    this.gender,
    this.email,
    this.avatar,
    this.phone,
    this.countryCode,
    // this.country,
  });
//TODO add password 
  User userFromJson(String str) {
    final Map<String, dynamic> data = json.decode(str);
    return User.fromJson(data);
  }

  String userToJson(User data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return json["os_id"] != null
        ? User(
            id: json["id"],
            name: json["name"],
            gender: json["gender"],
            osId: json["os_id"],
            email: json["email"],
            avatar: json["avatar"],
            phone: json["phone"],
            countryCode: json["country_code"],
            // country: Country.fromJson(json['country']),
          )
        : User(
            id: json["id"],
            name: json["name"],
            email: json["email"],
            avatar: json["avatar"],
          );
  }
  Map<String, dynamic> toJson() {
    return osId != null
        ? {
            "id": id,
            "name": name,
            "gender": gender,
            "os_id": osId,
            "email": email,
            "avatar": avatar,
            "phone": phone,
            "country_code": countryCode,
            // "country": country.toJson()
          }
        : {
            "id": id,
            "name": name,
            "email": email,
            "avatar": avatar,
          };
  }

  @override
  String toString() {
    return jsonEncode(this.toJson().toString());
  }
}
