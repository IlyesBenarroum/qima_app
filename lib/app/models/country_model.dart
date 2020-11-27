// import 'dart:convert';
// import 'provider.dart';

// class Country {
//   int id;
//   String code;
//   String name;
//   String dial;
//   String image;
//   List<Provider> providers = List();

//   Country({
//     this.id,
//     this.code,
//     this.name,
//     this.dial,
//     this.image,
//     this.providers,
//   });

//   Country userFromJson(String str) {
//     final jsonData = json.decode(str);
//     return Country.fromJson(jsonData);
//   }

//   String userToJson(Country data) {
//     final dyn = data.toJson();
//     return json.encode(dyn);
//   }

//   factory Country.fromJson(Map<String, dynamic> json) => Country(
//         id: json["id"],
//         code: json['code'],
//         name: json["name"],
//         dial: json['dial'],
//         image: json['image'],
//         providers: json['providers']
//         .map<Provider>((json) => Provider.fromJson(json))
//         .toList(),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "code": code,
//         "name": name,
//         "dial": dial,
//         "image": image,
//         "providers": (providers.map((e) => e.toJson()).toList()),
//       };
//   @override
//   String toString() {
//     return jsonEncode(this.toJson().toString());
//   }
// }
