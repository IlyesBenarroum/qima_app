class Country {
  int id;
  String name;
  String alpha2;
  String alpha3;

  Country({this.id, this.name, this.alpha2, this.alpha3});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alpha2 = json['alpha2'];
    alpha3 = json['alpha3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alpha2'] = this.alpha2;
    data['alpha3'] = this.alpha3;
    return data;
  }
}

