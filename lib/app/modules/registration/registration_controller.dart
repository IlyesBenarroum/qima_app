import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var signup;
  var fullName;
  var email;
  TextEditingController fullNameFeild;
  TextEditingController emailFeild;

  @override
  void onInit() {
    fullNameFeild = TextEditingController();
    emailFeild = TextEditingController();
    fullName = "".obs;
    email = "".obs;
    signup = true.obs;
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    fullNameFeild.dispose();
    emailFeild.dispose();
  }

  // String singInnwithEmail() {
  //   return """
  //  mutation {
  //       signupWithEmail(args:{
  //         fullName
  //         email
  //         phone
  //         password
  //       }){
  //         accessToken
  //       }
  //     }
  // """
  //       .replaceAll('\n', '');
  // }
}
