import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qima/app/models/auction_model.dart';
import 'package:qima/app/tools/tools.dart';
// import '../models/auction_model.dart';

class AuctionController extends GetxController {
  // var auctionsList = .obs;
  var auctionsList = List<Auction>().obs;

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
        arrearsValue: "0"),
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
      // "phone": "$phone"
      // },
//       documentNode: gql("""
//       mutation SignupWithEmail(\$name:String!,\$email:String,\$password:String,\$phone:String) {
//    signupWithEmail(args:{
//      fullName:\$name
//      email:\$email
//      password:\$password
//      phone:\$phone
//    }){
//      accessToken
//    }
//  }
// }
//   """
//           .replaceAll('\n', '')),
      documentNode: gql("""
  mutation createAuction {
    createAuction(
        auctionParams: {
                userID: "d1ba81e8-2226-4db9-be1d-67c12c237df3"
                startsAt: "${auction.auctionDate.substring(0, 10)}+${auction.auctionTiming.substring(11)}"
                length: "${int.parse(auction.auctionTiming)}"
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
      // .replaceAll('\n', '')),
      // document:
      //     addMutation.singInnwithEmail(user.name, user.email, user.password),
      // documentNode: gql(addMutation.singInnwithEmail()),
      onCompleted: (data) {
        print(data.data);
        print('completed');
        // print('FULL NAME' + fulllName);
      },
    ));
    if (!result.hasException) {
      print(result);
    } else {
      print(result.exception);
      // print(result);
    }
//     Mutation result = await _client.mutate(
//       MutationOptions(
//         documentNode: gql("""
// query getAllAuctions {
//   getAllAuctions{
//     id
//     startsAt
//  	  length
//   	entryPrice
//     product{
//       id
//       number
//     	arrearsValue
//       carrierID
//       countryID
//       subscription
//     	condition
//     }
//   }
// }
// """),
//       ),
//     );

    // var data = result.data.data["getAllAuctions"];
    // // print(result.exception);
    // // print(data[0]["id"]);

    // // print('hadi ta3 ilyes ' + data);

    // if (!result.hasException) {
    //   // print();
    //   if (!GetUtils.isNullOrBlank(data)) {
    //     for (var i = 0; i < data.length; i++) {
    //       auctionsList.add(
    //         Auction(
    //           id: data[i]["id"],
    //           auctionDate: data[i]["startsAt"],
    //           auctionTiming: data[i]["startsAt"],
    //           auctionPeriod: data[i]["length"],
    //           entryPrice: data[i]["entryPrice"],
    //           product: Product(
    //             id: data[i]["product"]["id"],
    //             serviceProvider: data[i]["product"]["carrierID"],
    //             specialNumber: data[i]["product"]["number"],
    //             // arrears: data[i]["product"]["arrears"],
    //             arrearsValue: data[i]["product"]["arrearsValue"],
    //             type: data[i]["product"]["subscription"],
    //             condition: data[i]["product"]["condition"],
    //             country: data[i]["product"]["countryID"],
    //           ),
    //         ),
    //       );
    //       auctionsList.refresh();
    //     }
    //   } else {
    //     return;
    //   }
    // }
  }

  void getAuctions() async {
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql("""
 query getAllAuctions {
        getAllAuctions{
							        id
											entryPrice
											startsAt
											length 
											product{
  														id
  														defaultPrice
															type
															condition
															options{
                                 __typename
   																		 ... on PhoneNumberOpts {
                                        countryID
                                        carrierID
                                        subscription
                                      }
                                	
                              }				
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
              auctionPeriod: data[i]["length"].toString(),
              entryPrice: data[i]["entryPrice"],
              product: Product(
                id: data[i]["product"]["id"],
                // serviceProvider: data[i]["product"]["carrierID"],
                // specialNumber: data[i]["product"]["number"],
                // arrearsValue: data[i]["product"]["arrearsValue"],
                type: data[i]["product"]["subscription"],
                condition: data[i]["product"]["condition"],
                // country: data[i]["product"]["countryID"],
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
