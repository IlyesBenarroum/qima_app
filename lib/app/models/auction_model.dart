class Auction {
  String country;
  String provider;
  String userId;
  String phoneNumber;
  bool usedPhone;
  bool postPaid;
  bool arrears;
  String arrearsValue;
  String auctionDate;
  String auctionTime;
  String auctionPeriod;
  String startingPrice;

  Auction({
    this.country,
    this.provider,
    this.userId,
    this.phoneNumber,
    this.usedPhone,
    this.postPaid,
    this.arrears,
    this.arrearsValue,
    this.auctionDate,
    this.auctionTime,
    this.auctionPeriod,
    this.startingPrice,
  });

  Auction.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    provider = json['provider'];
    userId = json['user_id'];
    phoneNumber = json['phone_number'];
    usedPhone = json['used_phone'];
    postPaid = json['post_paid'];
    arrears = json['arrears'];
    arrearsValue = json['arrears_value'];
    auctionDate = json['auction_date'];
    auctionTime = json['auction_time'];
    auctionPeriod = json['auction_period'];
    startingPrice = json['starting_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['country'] = this.country;
    data['provider'] = this.provider;
    data['user_id'] = this.userId;
    data['phone_number'] = this.phoneNumber;
    data['used_phone'] = this.usedPhone;
    data['post_paid'] = this.postPaid;
    data['arrears'] = this.arrears;
    data['arrears_value'] = this.arrearsValue;
    data['auction_date'] = this.auctionDate;
    data['auction_time'] = this.auctionTime;
    data['auction_period'] = this.auctionPeriod;
    data['starting_price'] = this.startingPrice;
    return data;
  }
}
