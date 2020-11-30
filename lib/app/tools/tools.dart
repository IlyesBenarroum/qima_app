import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'http://217.79.241.72/graphql'),
  ),
);

GraphQLClient clientToQuery() {
  return GraphQLClient(
    cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    // link: HttpLink(uri: 'http://217.79.241.72/graphql'),
    link: HttpLink(uri: 'http://217.79.241.72:3200/graphql'),
  );
}

// class Tools {
//   static String domaineName = "https://mbid.pw/api/v1/";
//   static List<Country> countriesList = List();
// }

class CheckInternet {
  static StreamSubscription<DataConnectionStatus> listener;
  static var internetStatus = "Unknown";
  static var contentmessage = "Unknown";
}
// import 'package:tiche_flutter/config.dart';

// class SocketService {
//   static IO.Socket socket;
//   String jsonData;
//   static createSocketConnection() {
//     socket = IO.io(
//       "http://217.79.241.72/auction",
//       <String, dynamic>{
//         'transports': ['websocket'],
//       },
//     );
//     socket.on("connect", (_) => print('connected'));
//     socket.on("disconnect", (_) => print('Disconnected'));
//   }

//   static bool checkSocketConnection() {
//     return socket.connected;
//   }

//   static void retrySocketConnection() {
//     socket.io.reconnecting = true;
//   }
// }

//  socket.on('exception', (e) => print('Exception: $e'));
//   socket.on('connect_error', (e) => print('Connect error: $e'));
// this.socket.on("auctions", (data) => print('data'));

// socket.io.autoConnect = true;
// print(socket.io.reconnecting);
// this.socket.on("connect", (_) {
// print(this.socket.flags);
// print(this.socket.connected);
//   this.socket.on("auctions", (data) {
//     // print(data);
//     print(data[1]);
//     // print(data[1]["entryPrice"]);
//   });
// });
