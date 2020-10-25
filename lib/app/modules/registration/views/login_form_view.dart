import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/models/user.dart';
import '../../../../app/modules/home/home_view.dart';
import '../../../../app/modules/registration/controllers/login_form_controller.dart';
import '../../../../app/modules/registration/widgets/custom_form_feild.dart';
import 'package:validators/validators.dart' as validator;

double screenHeight = Get.height;
double screenWidth = Get.width;

Pattern namePattern =
    r"(^[\u0621-\u064A-Za-z]{2,16})([ ]{0,1})([\u0621-\u064A-Za-z]{2,16})?([ ]{0,1})?([\u0621-\u064A-Za-z]{3,16})?([ ]{0,1})?([\u0621-\u064A-Za-z]{2,16})";
RegExp nameRegex = RegExp(namePattern, caseSensitive: false);

Pattern phonePattern = r"^(?:[+0]9)?[0-9]{10}$";
RegExp phoneRegex = RegExp(phonePattern);

User user = User();

class LoginFormView extends GetView {
  final _formKey = GlobalKey<FormState>();
  final LoginFormController controller = Get.put(LoginFormController());

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
                    if (value.length < 7) {
                      return "Password_should_be_minimum_7_characters".tr;
                    }
                    _formKey.currentState.save();
                    return null;
                  },
                  onSaved: (String value) {
                    user.password = value;
                  },
                  tapped: controller.passwordTapped.value,
                  onTap: () {
                    controller.passwordTapped.value = true;
                  },
                  onFieldSubmitted: (value) {
                    if (value.length == 0)
                      controller.passwordTapped.value = false;
                  },
                ),
              ),
              Container(
                height: screenHeight * 0.05,
                width: screenWidth * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [],
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
                    if (user.email.isNullOrBlank)
                      controller.emailTapped.value = false;
                    if (user.password.isNullOrBlank)
                      controller.passwordTapped.value = false;
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      Get.off(
                        HomeView(),
                      );
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
