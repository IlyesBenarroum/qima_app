import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qima/app/models/auction_model.dart';
import 'package:qima/app/tools/tools.dart';
// import '../models/auction_model.dart';

class AuctionController extends GetxController {
  // var auctionsList = .obs;
  var auctionsList = List<Auction>().obs;

  GraphQLClient _client = clientToQuery();
  @override
  void onInit() {
    getAuctions();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void getAuctions() async {
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql("""
query getAllAuctions {
  getAllAuctions{
    id
    startsAt
 	  length
  	entryPrice
    product{
      id
      number
    	arrearsValue 
      carrierID  
      countryID
      subscription
    	condition
    }
  }
}
"""),
      ),
    );

    var data = result.data.data["getAllAuctions"];
    // print(result.exception);
    // print(data[0]["id"]);

    // print('hadi ta3 ilyes ' + data);

    if (!result.hasException) {
      // print();
      if (!GetUtils.isNullOrBlank(data)) {
        for (var i = 0; i < data.length; i++) {
          auctionsList.add(
            Auction(
              id: data[i]["id"],
              auctionDate: data[i]["startsAt"],
              auctionTiming: data[i]["startsAt"],
              auctionPeriod: data[i]["length"],
              entryPrice: data[i]["entryPrice"],
              product: Product(
                id: data[i]["product"]["id"],
                serviceProvider: data[i]["product"]["carrierID"],
                specialNumber: data[i]["product"]["number"],
                // arrears: data[i]["product"]["arrears"],
                arrearsValue: data[i]["product"]["arrearsValue"],
                type: data[i]["product"]["subscription"],
                condition: data[i]["product"]["condition"],
                country: data[i]["product"]["countryID"],
              ),
            ),
          );
          auctionsList.refresh();
        }
      } else {
        return;
      }
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
