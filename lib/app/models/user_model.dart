import 'dart:convert';

class User {
  String id;
  String name;
  String email;
  String phone;
  String password;
  String avatar;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.avatar,
  });
  String userToJson(User data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }
 User userFromJson(String str) {
    final Map<String, dynamic> data = json.decode(str);
    return User.fromJson(data);
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['avatar'] = this.avatar;
    return data;
  }
}
