import 'package:get/get.dart';
import 'package:qima/app/models/country_model.dart';
import '../models/auction_model.dart';

class AuctionController extends GetxController {
  var auction = Auction(
    countryId: "",
    providerId: "",
    userId: "",
    phoneNumber: "",
    newPhone: false,
    postPaid: "",
    arrears: true,
    arrearsValue: "",
    auctionDate: "",
    auctionTime: "",
    auctionPeriod: "",
    startingPrice: "",
  ).obs;
  get countryId => auction.value.countryId;
  get providerId => auction.value.providerId;
  get userId => auction.value.userId;
  get phoneNumber => auction.value.phoneNumber;
  get postPaid => auction.value.postPaid;
  get arrears => auction.value.arrears;
  get arrearsValue => auction.value.arrearsValue;
  get auctionDate => auction.value.auctionDate;
  get auctionTime => auction.value.auctionTime;
  get auctionPeriod => auction.value.auctionPeriod;
  get startingPrice => auction.value.startingPrice;
  var auctionsList = [];
  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}
}
