import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qima/app/tools/popUps.dart';
import 'package:qima/app/tools/tools.dart';
import '../../../../app/models/user_model.dart';
import '../../../../app/modules/home/home_view.dart';
import '../../../../app/modules/registration/controllers/login_form_controller.dart';
import '../../../widgets/custom_form_feild.dart';
import 'package:validators/validators.dart' as validator;

double screenHeight = Get.height;
double screenWidth = Get.width;
String password = "";
Pattern namePattern =
    r"(^[\u0621-\u064A-Za-z]{2,16})([ ]{0,1})([\u0621-\u064A-Za-z]{2,16})?([ ]{0,1})?([\u0621-\u064A-Za-z]{3,16})?([ ]{0,1})?([\u0621-\u064A-Za-z]{2,16})";
RegExp nameRegex = RegExp(namePattern, caseSensitive: false);

Pattern phonePattern = r"^(?:[+0]9)?[0-9]{10}$";
RegExp phoneRegex = RegExp(phonePattern);

User user = User();

GraphQLClient _client = clientToQuery();
void signin() async {
  QueryResult result = await _client.mutate(MutationOptions(
    documentNode: gql("""
     mutation{
  loginWithEmail(args:{
    email:"azeazeazeaze@gmail.com",
    password:"zaezazea"
  }){
    accessToken
  }
}
      """),
    onCompleted: (data) {
      print(data.data["loginWithEmail"]["accessToken"]);
      print('completed');
      // Get.off(HomeView());
    },
  ));
  if (!result.hasException) {
    print(result);
  } else {
    print(result.exception);
    // print(result);
  }
  // print('result'+result.data);
}

class LoginFormView extends GetView {
  final _formKey = GlobalKey<FormState>();
  final LoginFormController controller = Get.put(LoginFormController());
  final String countryId;
  final String providerId;
  final String phone;
  final String newOrNot;
  final String paymentMethod;
  final String credit;
  LoginFormView(
      {this.countryId,
      this.providerId,
      this.phone,
      this.newOrNot,
      this.paymentMethod,
      this.credit});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: screenHeight * 0.4,
        width: screenWidth * 0.8,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //full name
              //email
              Obx(
                () => MyTextFormField(
                  // inputController: controller.emailTextEditFeild,
                  hintText: "Email".tr + " * ",
                  isEmail: true,
                  validator: (String value) {
                    if (!validator.isEmail(value)) {
                      return "Please_enter_a_valid_email".tr;
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    user.email = value;
                  },
                  tapped: controller.emailTapped.value,
                  onTap: () {
                    controller.emailTapped.value = true;

                    controller.passwordTapped.value = false;
                  },
                  onFieldSubmitted: (value) {
                    if (value.length == 0) controller.emailTapped.value = false;
                  },
                ),
              ),
              //password
              Obx(
                () => MyTextFormField(
                  hintText: "Password".tr + " * ",
                  isPassword: true,
                  validator: (String value) {
                    if (value.length <= 4) {
                      return "Password_should_be_minimum_7_characters".tr;
                    }
                    _formKey.currentState.save();
                    return null;
                  },
                  onSaved: (String value) {
                    password = value;
                  },
                  tapped: controller.passwordTapped.value,
                  onTap: () {
                    controller.passwordTapped.value = true;

                    controller.emailTapped.value = false;
                  },
                  onFieldSubmitted: (value) {
                    if (value.length == 0) {
                      controller.emailTapped.value = true;
                      controller.passwordTapped.value = false;
                    }
                  },
                ),
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              Container(
                height: screenHeight * 0.08,
                width: screenWidth * 0.8,
                child: RaisedButton(
                  color: Get.theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () async {
                    // if (user.email.isNullOrBlank)
                    controller.emailTapped.value = false;
                    // if (user.password.isNullOrBlank)
                    controller.passwordTapped.value = false;
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      {
                        String msg = "allo";
                        print(msg);
                        // msg = await controller.loginPost(
                        //     user.email, password, "0", "");
                        print(msg);
                        // if (msg == "success") {
                        //   Get.to(HomeView());
                        //   // Navigator.of(context).push(MaterialPageRoute(
                        //   //   builder: (context) => HomeView(
                        //   //       // countryId: countryId,
                        //   //       // providerId:providerId,
                        //   //       // newOrNot: newOrNot,
                        //   //       // paymentMethod:paymentMethod,
                        //   //       // credit:credit,
                        //   //       // phone: phone,
                        //   //       ),
                        //   // ));
                        // } else {
                        //   Get.snackbar(
                        //     "Error".tr,
                        //     "Please_Check_Your_Email_or_Password".tr,
                        //   );
                        //   // controller.emailTextEditFeild.text = "Error";
                        //   // showErrorDialog(context, msg);
                        // }
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => HomePage(),
                        // ));
                      }

                      // Get.off(
                      //   HomeView(),
                      // );
                    }
                    Get.to(HomeView());
                    signin();
                  },
                  child: Text(
                    "Login".tr,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
