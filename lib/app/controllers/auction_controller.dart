import 'package:get/get.dart';
import '../models/auction_model.dart';

class AuctionController extends GetxController {
 
  var auction = Auction(
    country: "",
    provider: "",
    userId: "",
    phoneNumber: "",
    usedPhone: false,
    postPaid: false,
    arrears: true,
    arrearsValue: "",
    auctionDate: "",
    auctionTime: "",
    auctionPeriod: "",
    startingPrice: "",
  ).obs;
  get country => auction.value.country;
  get provider => auction.value.provider;
  get userId => auction.value.userId;
  get phoneNumber => auction.value.phoneNumber;
  get postPaid => auction.value.postPaid;
  get arrears => auction.value.arrears;
  get usedPhone => auction.value.usedPhone;
  get arrearsValue => auction.value.arrearsValue;
  get auctionDate => auction.value.auctionDate;
  get auctionTime => auction.value.auctionTime;
  get auctionPeriod => auction.value.auctionPeriod;
  get startingPrice => auction.value.startingPrice;

  void setCountry(country) {
    auction.value.country = country;
    auction.refresh();
  }

  void setProvider(provider) {
    auction.value.provider = provider;
    auction.refresh();
  }

  void setUserId(userId) {
    auction.value.userId = userId;
    auction.refresh();
  }

  void setPhoneNumber(phoneNumber) {
    auction.value.phoneNumber = phoneNumber;
    auction.refresh();
  }

  void setUsedPhone(usedPhone) {
    auction.value.usedPhone = usedPhone;
    auction.refresh();
  }

  void setPostPaid(postPaid) {
    auction.value.postPaid = postPaid;
    auction.refresh();
  }

  void setArrears(arrears) {
    auction.value.arrears = arrears;
    auction.refresh();
  }

  void setArrearsValue(arrearsValue) {
    auction.value.arrearsValue = arrearsValue;
    auction.refresh();
  }

  void setAuctionDate(auctionDate) {
    auction.value.auctionDate = auctionDate;
    auction.refresh();
  }

  void setAuctionTime(auctionTime) {
    auction.value.auctionTime = auctionTime;
    auction.refresh();
  }

  void setAuctionPeriod(auctionPeriod) {
    auction.value.auctionPeriod = auctionPeriod;
    auction.refresh();
  }

  void setStartingPrice(startingPrice) {
    auction.value.startingPrice = startingPrice;
    auction.refresh();
  }

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}
}
