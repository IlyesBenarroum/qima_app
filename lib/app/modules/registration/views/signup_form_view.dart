import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qima/app/tools/tools.dart';
import '../../../tools/popUps.dart';
import '../../../../app/models/user_model.dart';
import '../../../../app/modules/home/home_view.dart';
import '../../../../app/modules/registration/controllers/signup_form_controller.dart';
import '../../../widgets/custom_form_feild.dart';
import 'package:validators/validators.dart' as validator;
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

Pattern namePattern =
    r"(^[\u0621-\u064A-Za-z]{2,16})([ ]{0,1})([\u0621-\u064A-Za-z]{2,16})?([ ]{0,1})?([\u0621-\u064A-Za-z]{3,16})?([ ]{0,1})?([\u0621-\u064A-Za-z]{2,16})";
RegExp nameRegex = RegExp(namePattern, caseSensitive: false);

Pattern phonePattern = r"^(?:[+0]9)?[0-9]{10}$";
RegExp phoneRegex = RegExp(phonePattern);
String password = "";
User user = User();

double screenHeight = Get.height;
double screenWidth = Get.width;

class SignupFormView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final SignupformController controller = Get.put(SignupformController());
//   String signinwithemail = """
//    mutation SignupWithEmail(\$user.name:String!,\$user.email:String!,\$password:String!,\$user.phone:String!) {
//   signupWithEmail(args:{
//     fullName:\$user.name
//     email:\$user.email
//     password:\$password
//     phone:\$user.phone
//   }){
//     accessToken
//   }
// }
//   """
//       .replaceAll('\n', '');
  GraphQLClient _client = clientToQuery();
  void signin() async {
    QueryResult result = await _client.mutate(MutationOptions(
      documentNode: gql("""
      mutation {
  signupWithEmail(args:{
    fullName:"ilyes"
    email:"gh@gmail.com"
    phone:"0782692788"
    password:"zaezazea"
  }){
    accessToken
  }
}
      """),
      onCompleted: (data) {
        print('completed');
        // Get.off(HomeView());
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: screenHeight * .73,
        width: screenWidth * 0.8,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //full name
              Obx(
                () => MyTextFormField(
                  hintText: "Full_Name".tr + " * ",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please_enter_your_full_name".tr;
                    } else if (!nameRegex.hasMatch(value)) {
                      return "Please_enter_a_valid_full_name".tr;
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    user.name = value;
                  },
                  tapped: controller.nameTapped.value,
                  onTap: () {
                    controller.nameTapped.value = true;
                    controller.emailTapped.value = false;
                    controller.phoneTapped.value = false;
                    controller.passwordTapped.value = false;
                  },
                  onFieldSubmitted: (value) {
                    if (value.length == 0) controller.nameTapped.value = false;
                  },
                ),
              ),

              //email
              Obx(
                () => MyTextFormField(
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

                    controller.nameTapped.value = false;
                    controller.phoneTapped.value = false;
                    controller.passwordTapped.value = false;
                  },
                  onFieldSubmitted: (value) {
                    if (value.length == 0) controller.emailTapped.value = false;
                  },
                ),
              ),
              //phone number
              Obx(
                () => MyTextFormField(
                  hintText: "Phone_number".tr + " * ",
                  validator: (String value) {
                    if (!phoneRegex.hasMatch(value)) {
                      return "Please_enter_a_valid_phone_number".tr;
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    user.phone = value;
                  },
                  tapped: controller.phoneTapped.value,
                  onTap: () {
                    controller.phoneTapped.value = true;
                    controller.passwordTapped.value = false;
                    controller.emailTapped.value = false;
                    controller.nameTapped.value = false;
                  },
                  onFieldSubmitted: (value) {
                    if (value.length == 0) controller.phoneTapped.value = false;
                  },
                ),
              ),
              //password
              Obx(
                () => MyTextFormField(
                  hintText: "Password".tr + " * ",
                  isPassword: true,
                  validator: (String value) {
                    if (value.length < 7) {
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
                    controller.nameTapped.value = false;
                    controller.phoneTapped.value = false;
                  },
                  onFieldSubmitted: (value) {
                    if (value.length == 0)
                      controller.passwordTapped.value = false;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                child: Container(
                  height: screenHeight * 0.05,
                  width: screenWidth * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth * 0.05,
                        height: screenWidth * 0.05,
                        child: Obx(
                          () => Checkbox(
                            value: controller.accept.value,
                            onChanged: (value) {
                              controller.accept.value =
                                  !controller.accept.value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.0125,
                      ),
                      Container(
                        height: screenHeight * 0.04,
                        width: screenWidth * 0.6,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: RichText(
                            text: TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {},
                              text:
                                  "I_agree_to_all_the_terms_and_conditions".tr,
                              style: TextStyle(
                                color: Get.theme.primaryColor,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.08,
                width: screenWidth * 0.8,
                child: RaisedButton(
                  color: Get.theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () {
                    // if (user.fullName.isNullOrBlank)
                    controller.nameTapped.value = false;
                    // if (user.email.isNullOrBlank)
                    controller.emailTapped.value = false;
                    // if (user.phoneNumber.isNullOrBlank)
                    controller.phoneTapped.value = false;
                    // if (user.password.isNullOrBlank)
                    controller.passwordTapped.value = false;
                    if (_formKey.currentState.validate() &&
                        controller.accept.value) {
                      _formKey.currentState.save();
                      // HomeView(),
                      // Get.off(
                      // postPopup();
                      // );
                      signin();
                      print('accepte');
                      print(user.name);
                      print(user.email);
                      print(user.phone);
                    }
                  },
                  child: Text(
                    "Create_an_account".tr,
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
