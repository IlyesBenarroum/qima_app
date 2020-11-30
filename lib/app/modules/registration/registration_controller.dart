import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegistrationController extends GetxController {
  var signup;
  var fullName;
  var email;
  TextEditingController fullNameFeild;
  TextEditingController emailFeild;
  GoogleSignIn googleSignIn;
  GoogleSignInAccount currentUser;
  @override
  void onInit() {
    fullNameFeild = TextEditingController();
    emailFeild = TextEditingController();
    fullName = "".obs;
    email = "".obs;
    signup = true.obs;
     googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      // setState(() {
      currentUser = account;
      print(account);
      print(currentUser);
      // });
    });
  }

  Future<void> handelSignIn() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    fullNameFeild.dispose();
    emailFeild.dispose();
  }
}
