class Auction {
  String id;
  String auctionDate;
  String auctionTiming;
  String auctionPeriod;
  String entryPrice;
  Product product;
  String get getId => id;
  String get getAuctionDate => auctionDate;
  String get getAuctionTiming => auctionTiming;
  String get getAuctionPeriod => auctionPeriod;
  String get getEntryPrice => entryPrice;
  Product get getProduct => product;

  set setId(String id) => this.id = id;
  set setAuctionDate(String auctionDate) => this.auctionDate = auctionDate;
  set setAuctionTiming(String auctionTiming) =>
      this.auctionTiming = auctionTiming;
  set setAuctionPeriod(String auctionPeriod) =>
      this.auctionPeriod = auctionPeriod;
  set setEntryPrice(String entryPrice) => this.entryPrice = entryPrice;
  set setProduct(Product product) => this.product = product;

  Auction({
    this.id,
    this.auctionDate,
    this.auctionTiming,
    this.auctionPeriod,
    this.entryPrice,
    this.product,
  });
}

class Product {
  String id;
  String type;
  String specialNumber;
  String serviceProvider;
  String condition;
  String country;
  int arrearsValue;

  Product({
    this.id,
    this.specialNumber,
    this.serviceProvider,
    this.condition,
    this.type,
    this.country,
    this.arrearsValue,
  });
  String get getId => id;
  String get getServiceProvider => serviceProvider;
  String get getSpecialNumber => specialNumber;
  String get getCondition => condition;
  String get getType => type;
  String get getCountry => country;
  int get getArrearsValue => arrearsValue;

  set setServiceProvider(String serviceProvider) =>
      this.serviceProvider = serviceProvider;
  set setSpecialNumber(String specialNumber) =>
      this.specialNumber = specialNumber;
  set setCondition(String condition) => this.condition = condition;
  set setType(String type) => this.type = type;
  set setCountry(String country) => this.country = country;
  set setArrearsValue(int arrearsValue) => this.arrearsValue = arrearsValue;
}
