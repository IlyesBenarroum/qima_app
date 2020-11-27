class Provider {
  String countryID;
  String countryName;
  String flag;
  List<Carriers> carriers;

  Provider({this.countryID,this.countryName,this.flag,this.carriers});



 String get getFlag => flag;
 set setFlag(String flag) => this.flag = flag;
 String get getCountryName => countryName;

 set setCountryName(String countryName) => this.countryName = countryName;

 List get getCarriers => carriers;

 set setCarriers(List carriers) => this.carriers = carriers;
  
}

class Carriers {
  String carrierName;
  String carrierID;

  Carriers({this.carrierName, this.carrierID});


 String get getCarrierName => carrierName;

 set setCarrierName(String carrierName) => this.carrierName = carrierName;

 String get getCarrierID => carrierID;

 set setCarrierID(String carrierID) => this.carrierID = carrierID;
}


