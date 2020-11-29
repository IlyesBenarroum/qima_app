import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qima/app/models/auction_model.dart';
import 'package:qima/app/tools/tools.dart';
// import '../models/auction_model.dart';

class AuctionController extends GetxController {
  // var auctionsList = .obs;
  var auctionsList = List<Auction>().obs;
  var joinedList = List<Auction>().obs;
  var intressetList = List<Auction>().obs;

  var auction = Auction(
    auctionDate: "${DateTime.now().toIso8601String()}",
    auctionTiming: "${DateTime.now().toIso8601String()}",
    auctionPeriod: "30",
    entryPrice: "0",
    product: Product(
      type: "PHONE_NUMBER",
      specialNumber: "",
      serviceProvider: "42001",
      condition: "NEW",
      subscription: "",
      country: "SA",
      arrearsValue: "0",
    ),
  ).obs;
  get country => auction.value.product.country;
  get serviceProvider => auction.value.product.serviceProvider;
// get userId => auction.value.userId;
  get specialNumber => auction.value.product.specialNumber;
  get subscription => auction.value.product.subscription;
// get arrears => auction.value;
  get condition => auction.value.product.condition;
  get arrearsValue => auction.value.product.arrearsValue;
  get auctionDate => auction.value.auctionDate;
  get auctionTiming => auction.value.auctionTiming;
  get auctionPeriod => auction.value.auctionPeriod;
  get entryPrice => auction.value.entryPrice;

  void setCountry(country) {
    auction.value.product.country = country;
    auction.refresh();
  }

  void setSpecialNumber(specialNumber) {
    auction.value.product.specialNumber = specialNumber;
    auction.refresh();
  }

  void setServiceProvider(provider) {
    auction.value.product.serviceProvider = provider;
    auction.refresh();
  }

// void setUserId(userId) {
//   auction.value.userId = userId;
//   auction.refresh();
// }

  void setPhoneNumber(phoneNumber) {
    auction.value.product.setSpecialNumber = phoneNumber;
    auction.refresh();
  }

  void setCondition(usedPhone) {
    auction.value.product.condition = condition;
    auction.refresh();
  }

  void setsubscription(subscription) {
    auction.value.product.subscription = subscription;
    auction.refresh();
  }

// void setArrears(arrears) {
//   auction.value.arrears = arrears;
//   auction.refresh();
// }

  void setArrearsValue(arrearsValue) {
    auction.value.product.arrearsValue = arrearsValue;
    auction.refresh();
  }

  void setAuctionDate(auctionDate) {
    auction.value.auctionDate = auctionDate;
    auction.refresh();
  }

  void setAuctionTiming(auctionTime) {
    auction.value.auctionTiming = auctionTime;
    auction.refresh();
  }

  void setAuctionPeriod(auctionPeriod) {
    auction.value.auctionPeriod = auctionPeriod;
    auction.refresh();
  }

  void setEntryPrice(entryPrice) {
    auction.value.entryPrice = entryPrice;
    auction.refresh();
  }

  GraphQLClient _client = clientToQuery();
  @override
  void onInit() {
    getAuctions();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
  void addAuction(Auction auction) async {
    QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql("""
  mutation createAuction {
    createAuction(
        auctionParams: {
                userID: "d38a0049-27d3-4226-845e-862af46b401c"
                startsAt: "${auction.auctionDate.substring(0, 9)}${auction.auctionTiming.substring(10)}"
                length: ${int.parse(auction.auctionPeriod)}
                entryPrice:"${auction.entryPrice}"
    }
    productParams: {
                defaultPrice: "${auction.entryPrice}"
                type: ${auction.product.type}
                condition: ${auction.product.condition}
                options: {
                  number: "${auction.product.specialNumber}"
                  countryID: "${auction.product.country}"
                  carrierID: "${auction.product.serviceProvider}"
                  arrearsValue: "${auction.product.arrearsValue}"
      }
    }
  )
}
      """),

      // onCompleted: (data) {
      //   // print(data.data["createAuction"]);
      //   print('completed');
      //   // print('FULL NAME' + fulllName);
      // },
    ));
    if (!result.hasException) {
      print(result.data.data["createAuction"]);
    } else {
      print(result.exception);
      // print(result);
    }
  }

  Future<void> getAuctions() async {
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql("""
 query getAuctions{
  getAllAuctions{
    id
  	entryPrice
    startsAt
    length
    product
    {
      id
      countryID
      carrierID
      condition
    	number
      subscription
      arrearsValue
    }
  }
}
"""),
      ),
    );

    var data = result.data.data["getAllAuctions"];

    print("get auctions");
    if (!result.hasException) {
      // print();
      if (!GetUtils.isNullOrBlank(data)) {
        auctionsList.clear();
        print("get auctions");
        for (var i = 0; i < data.length; i++) {
          auctionsList.add(
            Auction(
              id: data[i]["id"],
              auctionDate: data[i]["startsAt"],
              auctionTiming: data[i]["startsAt"],
              auctionPeriod: data[i]["length"].toString(),
              entryPrice: data[i]["entryPrice"],
              product: Product(
                id: data[i]["product"]["id"],
                serviceProvider: data[i]["product"]["carrierID"],
                specialNumber: data[i]["product"]["number"],
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
    auctionsList.refresh();
  }

  Future<void> getIntressetedAuctions() async {
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql("""
query followedAuctions {
  getUserByID(userID: "4a3360b5-3ef8-4763-9e45-7abf1717dfd9") {
    followedAuctions {
      id
      entryPrice
      startsAt
      length
      product {
        id
        countryID
        carrierID
        condition
        number
        subscription
        arrearsValue
      }
    }
  }
}
"""),
      ),
    );

    var data = result.data.data["getUserByID"];

    print("get  intressetd auctions");
    if (!result.hasException) {
      // print();
      if (!GetUtils.isNullOrBlank(data)) {
        intressetList.clear();
        print("get  intressetd auctions");
        // print("get auctions");
        for (var i = 0; i < data.length; i++) {
          intressetList.add(
            Auction(
              id: data[i]["id"],
              auctionDate: data[i]["startsAt"],
              auctionTiming: data[i]["startsAt"],
              auctionPeriod: data[i]["length"].toString(),
              entryPrice: data[i]["entryPrice"],
              product: Product(
                id: data[i]["product"]["id"],
                serviceProvider: data[i]["product"]["carrierID"],
                specialNumber: data[i]["product"]["number"],
                arrearsValue: data[i]["product"]["arrearsValue"],
                type: data[i]["product"]["subscription"],
                condition: data[i]["product"]["condition"],
                country: data[i]["product"]["countryID"],
              ),
            ),
          );
          intressetList.refresh();
        }
      } else {
        return;
      }
    }
    intressetList.refresh();
  }

  Future<void> getJoinedAuctions() async {
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql("""
query followedAuctions {
  getUserByID(userID: "4a3360b5-3ef8-4763-9e45-7abf1717dfd9") {
    joinedAuctions {
      id
      entryPrice
      startsAt
      length
      product {
        id
        countryID
        carrierID
        condition
        number
        subscription
        arrearsValue
      }
    }
  }
}
"""),
      ),
    );

    var data = result.data.data["getUserByID"];

    print("get  joinedAuctions ");
    if (!result.hasException) {
      // print();
      if (!GetUtils.isNullOrBlank(data)) {
        joinedList.clear();
        print("get joinedAuctions");
        // print("get auctions");
        for (var i = 0; i < data.length; i++) {
          intressetList.add(
            Auction(
              id: data[i]["id"],
              auctionDate: data[i]["startsAt"],
              auctionTiming: data[i]["startsAt"],
              auctionPeriod: data[i]["length"].toString(),
              entryPrice: data[i]["entryPrice"],
              product: Product(
                id: data[i]["product"]["id"],
                serviceProvider: data[i]["product"]["carrierID"],
                specialNumber: data[i]["product"]["number"],
                arrearsValue: data[i]["product"]["arrearsValue"],
                type: data[i]["product"]["subscription"],
                condition: data[i]["product"]["condition"],
                country: data[i]["product"]["countryID"],
              ),
            ),
          );
          intressetList.refresh();
        }
      } else {
        return;
      }
    }
    intressetList.refresh();
  }

  void joinAuction(String auctionID) async {
    QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql("""
                            mutation join{joinAuction(
                              userID:"4a3360b5-3ef8-4763-9e45-7abf1717dfd9"
                            auctionID:"$auctionID")
}
      """),
    ));
    if (!result.hasException) {
      print(result.data.data);
    } else {
      print(result.exception);
      // print(result);
    }
  }

  void intrestAuction(String auctionID) async {
    QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql("""
                            mutation intrest{followAuction(
                              userID:"4a3360b5-3ef8-4763-9e45-7abf1717dfd9"
                            auctionID:"$auctionID")
}
      """),
    ));
    if (!result.hasException) {
      print(result.data.data);
    } else {
      print(result.exception);
      // print(result);
    }
  }
}
