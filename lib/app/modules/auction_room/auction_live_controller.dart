import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qima/app/modules/splash/splash_controller.dart';

class AuctionLiveController extends GetxController {
  final count = 0.obs;
  static final WebSocketLink _webSocketLink = WebSocketLink(
    url: 'ws://185.70.196.103/dev/graphql',
    config: SocketClientConfig(
      autoReconnect: true,

      // initPayload: () => {
      //   "Authorization":
      //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjksImNyZWF0ZWRBdCI6MTYwNTk0MDY2ODE5MSwiaWF0IjoxNjA1OTQwNjY4fQ.MXTG82ybAF9rmBdlTpqy6XR1N9cCl983H8EZ76YlQCw/b5aac2d4-2bc2-11eb-adc1-0242ac120002"
      // },
    ),
  );
  static final Link link = _webSocketLink;
  final GraphQLClient client = GraphQLClient(
    link: link,
    cache: InMemoryCache(),
  );
  Operation operation;
  Operation operation2;

  Stream<FetchResult> logStream;
  Stream<FetchResult> logStream2;
  // Stream<BroadcastChannel> logStream;
  @override
  void onInit() {
    operation = Operation(
      documentNode: gql("""   
      subscription sub{
  subToEvents(
    userID:"${userS.id}"
  )
}
 """),
    );
    logStream = client.subscribe(operation);
    operation2 = Operation(
      documentNode: gql("""   
      subscription sub{
  subToEvents(
    userID:"${userS.id}"
  )
}
 """),
    );
    logStream2 = client.subscribe(operation2);
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;
}
