import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserOnline {
  static User user;
  static bool userIsOnline;
  static String token;
}

Future saveUser() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool("userIsOnline", UserOnline.userIsOnline);
  await prefs.setString("token", UserOnline.token);

  if (UserOnline.user != null) {
    // print("if stataement" + UserOnline.user.toString());
    await prefs.setString(
        "user", ((UserOnline.user.userToJson(UserOnline.user))));
  }
}

Future getUser() async {
  final prefs = await SharedPreferences.getInstance();
  String json = await prefs.getString("user");

  UserOnline.userIsOnline = prefs.getBool("userIsOnline") ?? false;
  // print("Get user " + UserOnline.userIsOnline.toString());
  if (UserOnline.userIsOnline) {
    if (json != null)
      UserOnline.user =
          UserOnline.user.userFromJson(json.substring(0, json.length));

    UserOnline.user = UserOnline.user.userFromJson(prefs.getString("user"));

    UserOnline.token = prefs.getString("token") ?? "";
  }
}

Future deleteUser() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  UserOnline.token = "";
  UserOnline.userIsOnline = false;
  UserOnline.user = User();

  await prefs.setBool("userIsOnline", UserOnline.userIsOnline);
}
