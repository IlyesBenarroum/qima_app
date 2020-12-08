import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qima/app/models/auction_model.dart';
import 'package:qima/app/modules/splash/splash_controller.dart';
import 'package:qima/app/tools/tools.dart';

import '../../gloabals.dart';
// import '../models/auction_model.dart';

class AuctionController extends GetxController {
  // var auctionsList = .obs;
  var auctionsList = List<Auction>().obs;
  var joinedList = List<Auction>().obs;
  var intressetList = List<Auction>().obs;
  var ownerList = List<Auction>().obs;

  var auction = Auction(
    auctionDate: "${DateTime.now().toIso8601String()}",
    auctionTiming: "${DateTime.now().toIso8601String()}",
    auctionPeriod: "30",
    entryPrice: "0",
    product: Product(
      type: "PHONE_NUMBER",
      specialNumber: "",
      serviceProvider: "",
      condition: "",
      subscription: "",
      country: "",
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
    getJoinedAuctions();
    getIntressetedAuctions();
    getOwnedAuctions();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void placeBid(String amount, String auctionID) async {
    GraphQLClient placebidClient = clientToQuery();
    QueryResult result =
        await placebidClient.mutate(MutationOptions(documentNode: gql("""
   mutation bid{
placeBid(
amount: "$amount"
userID: "${userS.id}"
auctionID: "$auctionID"
)
}
  
      """)));
    if (!result.hasException) {
      // print(result.data.data);
    } else {
      // print(result.exception);
      // print(result);
    }
  }

  void addAuction(Auction auction) async {
    GraphQLClient createClient = clientToQuery();
    QueryResult result = await createClient.mutate(MutationOptions(
      documentNode: gql("""

mutation createAuction1 {
    createAuction(
        auctionParams: {
                userID: "${userS.id}"
                startsAt: "${DateTime.now().toIso8601String()}"
                length: ${int.parse(auction.auctionPeriod)}
                entryPrice:"${auction.entryPrice}"
                }
    productParams: {
                defaultPrice: "${auction.entryPrice}"
                type: PHONE_NUMBER
                condition: ${auction.product.condition}
                options: {
                  number: "${auction.product.specialNumber}"
                  countryID: "${auction.product.country}"
                  carrierID: "${Globals.provider}"
                  arrearsValue: "${auction.product.arrearsValue}"
      }
    }
  )
}
 """),
    ));
    if (!result.hasException) {
      // print(result.data.data["createAuction"]);
    } else {
      // print(result.exception);
      // print(result);
    }
    getAuctions();
  }

  Future<void> getAuctions() async {
    GraphQLClient _getclient = clientToQuery();
    QueryResult result = await _getclient.query(
      QueryOptions(
        documentNode: gql("""
        query getAuctions{
          getAllAuctions{
    id
  	entryPrice
    startsAt
    length
    joinedBy{id}
    createdBy{id}
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
    // print(data[0]["subscription"]);
    if (!result.hasException) {
      if (!GetUtils.isNullOrBlank(data)) {
        auctionsList.clear();

        for (var i = 0; i < data.length; i++) {
          auctionsList.add(
            Auction(
              id: data[i]["id"],
              auctionDate: data[i]["startsAt"],
              auctionTiming: data[i]["startsAt"],
              joiners: data[i]["joinedBy"].length,
              auctionPeriod: data[i]["length"].toString(),
              createdBy: data[i]["createdBy"]['id'],
              entryPrice: data[i]["entryPrice"],
              product: Product(
                id: data[i]["product"]["id"],
                serviceProvider: data[i]["product"]["carrierID"],
                specialNumber: data[i]["product"]["number"],
                arrearsValue: data[i]["product"]["arrearsValue"],
                subscription: data[i]["product"]["subscription"],
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
    sortAuctions();
    auctionsList.refresh();
  }

  Future<void> getOwnedAuctions() async {
    GraphQLClient getOwned = clientToQuery();
    QueryResult result = await getOwned.query(
      QueryOptions(
        documentNode: gql("""

query getOwned {
  getCreatedAuctionsByUserID(userID: "${userS.id}") {
    
      id
      entryPrice
      startsAt
      length
      joinedBy{id}
      createdBy{id}
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

"""),
      ),
    );

    var data = result.data.data["getCreatedAuctionsByUserID"];

    if (!result.hasException) {
      if (!GetUtils.isNullOrBlank(data)) {
        ownerList.clear();

        for (var i = 0; i < data.length; i++) {
          ownerList.add(
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
                subscription: data[i]["product"]["subscription"],
                condition: data[i]["product"]["condition"],
                country: data[i]["product"]["countryID"],
              ),
            ),
          );
          ownerList.refresh();
        }
      } else {
        return;
      }
    }
    ownerList.refresh();
  }

  Future<void> getIntressetedAuctions() async {
    GraphQLClient getIntresseted = clientToQuery();
    QueryResult result = await getIntresseted.query(
      QueryOptions(
        documentNode: gql("""
query getFollow {
  getFollowedAuctionsByUserID(userID: "${userS.id}") {
    
      id
      entryPrice
      startsAt
      length
      joinedBy{id}
      createdBy{id}
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
"""),
      ),
    );

    var data = result.data.data["getFollowedAuctionsByUserID"];

    if (!result.hasException) {
      // print();
      // print(data[0]["id"]);
      if (!GetUtils.isNullOrBlank(data)) {
        intressetList.clear();

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
                subscription: data[i]["product"]["subscription"],
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
    GraphQLClient getJoin = clientToQuery();

    QueryResult result = await getJoin.query(
      QueryOptions(
        documentNode: gql("""
query getJoin {
  getJoinedAuctionsByUserID(userID: "${userS.id}") {
    
      id
      entryPrice
      startsAt
      length
      joinedBy{id}
      createdBy{id}
      startsAt
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
"""),
      ),
    );

    var data = result.data.data["getJoinedAuctionsByUserID"];

    if (!result.hasException) {
      // print();

      if (!GetUtils.isNullOrBlank(data)) {
        joinedList.clear();

        // print("get auctions");
        for (var i = 0; i < data.length; i++) {
          joinedList.add(
            Auction(
              id: data[i]["id"],
              auctionDate: data[i]["startsAt"],
              auctionTiming: data[i]["startsAt"],
              auctionPeriod: data[i]["length"].toString(),
              joiners: data[i]["joinedBy"].length,
              entryPrice: data[i]["entryPrice"],
              createdBy: data[i]["createdBy"],
              startsAt: data[i]["startsAt"],
              product: Product(
                id: data[i]["product"]["id"],
                serviceProvider: data[i]["product"]["carrierID"],
                specialNumber: data[i]["product"]["number"],
                arrearsValue: data[i]["product"]["arrearsValue"],
                subscription: data[i]["product"]["subscription"],
                condition: data[i]["product"]["condition"],
                country: data[i]["product"]["countryID"],
              ),
            ),
          );
          joinedList.refresh();
        }
      } else {
        return;
      }
    }
    joinedList.refresh();
  }

  void joinAuction(String auctionID) async {
    QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql("""
                            mutation join{joinAuction(
                              userID:"${userS.id}"
                            auctionID:"$auctionID")
}
      """),
    ));
    if (!result.hasException) {
      // print(result.data.data);
    } else {
      // print(result.exception);
      // print(result);
    }
  }

  void intrestAuction(String auctionID) async {
    QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql("""
                            mutation intrest{followAuction(
                              userID:"${userS.id}"
                            auctionID:"$auctionID")
}
      """),
    ));
    if (!result.hasException) {
      // print(result.data.data);
    } else {
      // print(result.exception);
      // print(result);
    }
  }

  void sortAuctions() {
    auctionsList.sort((a, b) {
      var adate = a.auctionDate; //before -> var adate = a.expiry;
      var bdate = b.auctionDate; //var bdate = b.expiry;
      return -adate.compareTo(bdate);
    });
  }
}
