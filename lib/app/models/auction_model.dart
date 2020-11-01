class Auction {
  String countryId;
  String providerId;
  String userId;
  String phoneNumber;
  bool newPhone;
  String postPaid;
  bool arrears;
  String arrearsValue;
  String auctionDate;
  String auctionTime;
  String period;
  String startingPrice;

  Auction(
      {this.countryId,
      this.providerId,
      this.userId,
      this.phoneNumber,
      this.newPhone,
      this.postPaid,
      this.arrears,
      this.arrearsValue,
      this.auctionDate,
      this.auctionTime,
      this.period,
      this.startingPrice});

  Auction.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    providerId = json['provider_id'];
    userId = json['user_id'];
    phoneNumber = json['phone_number'];
    newPhone = json['new_phone'];
    postPaid = json['post_paid'];
    arrears = json['arrears'];
    arrearsValue = json['arrears_value'];
    auctionDate = json['auction_date'];
    auctionTime = json['auction_time'];
    period = json['period'];
    startingPrice = json['starting_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['provider_id'] = this.providerId;
    data['user_id'] = this.userId;
    data['phone_number'] = this.phoneNumber;
    data['new_phone'] = this.newPhone;
    data['post_paid'] = this.postPaid;
    data['arrears'] = this.arrears;
    data['arrears_value'] = this.arrearsValue;
    data['auction_date'] = this.auctionDate;
    data['auction_time'] = this.auctionTime;
    data['period'] = this.period;
    data['starting_price'] = this.startingPrice;
    return data;
  }
}
