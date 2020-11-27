import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qima/app/models/provider_model.dart';
import 'package:qima/app/tools/tools.dart';
// import '../models/auction_model.dart';

class ProviderController extends GetxController {
  // var auctionsList = .obs;
  var providersList = List<Provider>().obs;
  var carriersList = List<Carriers>().obs;
  GraphQLClient _client = clientToQuery();
  @override
  void onInit() {
    getProviders();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void getProviders() async {
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql("""
              query getCountry{getCarriers}
  """),
      ),
    );

    var data = result.data.data["getCarriers"];

    if (!result.hasException) {
      if (!GetUtils.isNullOrBlank(data)) {
        for (var i = 0; i < data.length; i++) {
          for (var j = 0; j < data[i]["carriers"].length; j++) {
            carriersList.add(
              Carriers(
                carrierID: data[i]["carriers"][j]["carrierID"],
                carrierName: data[i]["carriers"][j]["carrierName"],
              ),
            );
          }
          carriersList.refresh();
          print(data[0]["carriers"]);
          providersList.add(
            Provider(
              // countryID: CountryID(
              countryID: data[i]["countryID"],
              flag: data[i]["flag"],
              countryName: data[i]["countryName"],
              carriers: carriersList,
              // ),
            ),
          );
          for (var j = 0; j < data[i]["carriers"].length; j++) {
            print("");
          }
          providersList.refresh();
        }
      } else {
        return;
      }
      // update();
    }
  }
}
// var auction = Auction(
//   country: "",
//   provider: "",
//   userId: "",
//   phoneNumber: "",
//   usedPhone: false,
//   postPaid: false,
//   arrears: true,
//   arrearsValue: "",
//   auctionDate: "",
//   auctionTime: "",
//   auctionPeriod: "",
//   startingPrice: "",
// ).obs;
// get country => auction.value.country;
// get provider => auction.value.provider;
// get userId => auction.value.userId;
// get phoneNumber => auction.value.phoneNumber;
// get postPaid => auction.value.postPaid;
// get arrears => auction.value.arrears;
// get usedPhone => auction.value.usedPhone;
// get arrearsValue => auction.value.arrearsValue;
// get auctionDate => auction.value.auctionDate;
// get auctionTime => auction.value.auctionTime;
// get auctionPeriod => auction.value.auctionPeriod;
// get startingPrice => auction.value.startingPrice;

// void setCountry(country) {
//   auction.value.country = country;
//   auction.refresh();
// }

// void setProvider(provider) {
//   auction.value.provider = provider;
//   auction.refresh();
// }

// void setUserId(userId) {
//   auction.value.userId = userId;
//   auction.refresh();
// }

// void setPhoneNumber(phoneNumber) {
//   auction.value.phoneNumber = phoneNumber;
//   auction.refresh();
// }

// void setUsedPhone(usedPhone) {
//   auction.value.usedPhone = usedPhone;
//   auction.refresh();
// }

// void setPostPaid(postPaid) {
//   auction.value.postPaid = postPaid;
//   auction.refresh();
// }

// void setArrears(arrears) {
//   auction.value.arrears = arrears;
//   auction.refresh();
// }

// void setArrearsValue(arrearsValue) {
//   auction.value.arrearsValue = arrearsValue;
//   auction.refresh();
// }

// void setAuctionDate(auctionDate) {
//   auction.value.auctionDate = auctionDate;
//   auction.refresh();
// }

// void setAuctionTime(auctionTime) {
//   auction.value.auctionTime = auctionTime;
//   auction.refresh();
// }

// void setAuctionPeriod(auctionPeriod) {
//   auction.value.auctionPeriod = auctionPeriod;
//   auction.refresh();
// }

// void setStartingPrice(startingPrice) {
//   auction.value.startingPrice = startingPrice;
//   auction.refresh();
// }
