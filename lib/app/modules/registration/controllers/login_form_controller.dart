import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../models/user_model.dart';
import '../../../tools/tools.dart';
import '../../../state/userState.dart';

class LoginFormController extends GetxController {
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.acceptHeader: "application/json",
  };
  Future<String> loginPost(
      String email, String password, String usertype, String osId) async {
    var returnMessage = "";
    print("login");
    String url = Tools.domaineName +
        'login?email=$email&password=$password&userType=$usertype&os_id=$osId';
    print(url);
    Response response = await post(url, headers: headers);

    int statusCode = response.statusCode;

    // print("statusCode " + statusCode.toString());
    print(response.body);
    // print("return messages" + returnMessage);

    if (statusCode == 200) {
      returnMessage = "success";

      var data = jsonDecode(response.body);
      // print(data['user']);
      UserOnline.user = User.fromJson(data["user"]);
      UserOnline.userIsOnline = true;
      UserOnline.token = data["access_token"];
      print("return messages1 " + returnMessage);
      await saveUser();
    } else {
      print("return messages " + returnMessage);

      var data = jsonDecode(response.body);
      var rest = data["message"];
      returnMessage = "error: $rest";
    }
    print("return messages2 " + returnMessage);
    return returnMessage;
  }

  var emailTapped = false.obs;
  var passwordTapped = false.obs;
  TextEditingController emailTextEditFeild;
  TextEditingController passwordTextEditFeild;
  @override
  void onInit() {
    emailTextEditFeild = TextEditingController();
    passwordTextEditFeild = TextEditingController();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    emailTextEditFeild.dispose();
    passwordTextEditFeild.dispose();
  }
}
