import 'dart:convert';
class Provider {
  int id;
  String countryId;
  String title;
  String image;

  Provider({this.id, this.countryId, this.title, this.image});

  Provider userFromJson(String str) {
    final jsonData = json.decode(str);
    return Provider.fromJson(jsonData);
  }

  String userToJson(Provider data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
      id: json["id"],
      countryId: json['country_id'],
      title: json['title'],
      image: json['image']);

  Map<String, dynamic> toJson() =>
      {"id": id, "country_id": countryId, "title": title, "image": image};
  @override
  String toString() {
    return jsonEncode(this.toJson().toString());
  }
}
