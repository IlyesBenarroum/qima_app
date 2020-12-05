import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/auction_room/auction_live_view.dart';
import '../modules/registration/controllers/signup_form_controller.dart';

class MyTextFormField extends GetView {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  final bool isPhone;
  final bool tapped;
  final Function onTap;
  final Function onFieldSubmitted;
  // final bool isPhone;
  // final TextEditingController inputController;

// <<<<<<< testA
  MyTextFormField(
      {this.hintText,
      this.validator,
      this.onSaved,
      this.isPassword = false,
      this.isEmail = false,
      this.tapped,
      this.onTap,
      this.onFieldSubmitted,
      this.isPhone = false,
      // this.inputController,
      });
// =======
//   MyTextFormField({
//     this.hintText,
//     this.validator,
//     this.onSaved,
//     this.isPassword = false,
//     this.isEmail = false,
//     this.isPhone = false,
//     this.tapped,
//     this.onTap,
//     this.onFieldSubmitted,
//     // this.inputController,
//   });
// >>>>>>> main
  final SignupformController controller = Get.put(SignupformController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.025),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextFormField(
          // controller: inputController,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
            filled: true,
            fillColor:
                tapped ? Colors.white : Get.theme.primaryColor.withOpacity(0.1),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Get.theme.primaryColor,
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Get.theme.primaryColor,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Get.theme.primaryColor,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Get.theme.primaryColor.withOpacity(0.1),
                width: 1.0,
              ),
            ),
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.withOpacity(1),
            ),
            errorStyle: TextStyle(
              color: Color(0xffd8b00f),
              fontSize: 10,
            ),
          ),
          obscureText: isPassword ? true : false,
          validator: validator,
          onSaved: onSaved,
          keyboardType: isEmail
              ? TextInputType.emailAddress
              : isPhone
                  ? TextInputType.phone
                  : TextInputType.text,
          cursorColor: Get.theme.primaryColor,
          textAlignVertical: TextAlignVertical.bottom,
          onTap: onTap,
        ),
      ),
    );
  }
}
