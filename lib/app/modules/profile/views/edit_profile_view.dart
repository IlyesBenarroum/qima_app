import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/user_controller.dart';
import 'package:qima/app/modules/home/home_view.dart';
// import '../../../../gloabals.dart';
// import '../../../models/user_model.dart';
import '../../../widgets/custom_form_feild.dart';
import '../controllers/edit_profile_controllers.dart';
import 'package:validators/validators.dart' as validator;
import 'package:image_picker/image_picker.dart';

// import 'add_picture.dart';

double screenHeight = Get.height;
double screenWidth = Get.width;
// User user = User();
Pattern namePattern =
    r"(^[\u0621-\u064A-Za-z]{2,16})([ ]{0,1})([\u0621-\u064A-Za-z]{2,16})?([ ]{0,1})?([\u0621-\u064A-Za-z]{3,16})?([ ]{0,1})?([\u0621-\u064A-Za-z]{2,16})";
RegExp nameRegex = RegExp(namePattern, caseSensitive: false);

Pattern phonePattern = r"^(?:[+0]9)?[0-9]{10}$";
RegExp phoneRegex = RegExp(phonePattern);

// User user = User();
final _formKey = GlobalKey<FormState>();
final EditProfileController controller = Get.put(EditProfileController());
final UserController userController = Get.put(UserController());

class EditProfileView extends GetView {
  @override
  Widget build(BuildContext context) {
    // print(Globals.imagePath);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.transparent,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: Get.width,
                height: Get.height * .35,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 2),
                    )
                  ],
                  color: Colors.blueGrey,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => Visibility(
                          visible:
                              GetUtils.isNullOrBlank(userController.avatar),
                          // visible: userController.avatar == "",
                          child: Container(
                            width: Get.width * 0.3,
                            height: Get.width * 0.3,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/2/28/Sillitoe-black-white.gif",
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible:
                              !GetUtils.isNullOrBlank(userController.avatar),
                          // visible: userController.avatar != "",
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              File(userController.avatar),
                              fit: BoxFit.fill,
                              width: Get.width * 0.3,
                              height: Get.width * 0.3,
                            ),
                          ),
                        ),
                      ),
                      // Visibility(
                      // //   ),
                      Obx(
                        () => Text(
                          userController.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: Get.height * 0.31,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 20,
            //     ),
            //     child: Text(
            //       Get.locale.languageCode == "en"
            //           ? "+249912300000"
            //           : "249912300000+",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              top: Get.height * 0.32,
              left: Get.locale.languageCode == "en"
                  ? Get.width * 0.8
                  : Get.width * 0.05,
              right: Get.locale.languageCode == "en"
                  ? Get.width * 0.05
                  : Get.width * 0.8,
              child: Container(
                width: Get.width * 0.12,
                height: Get.width * 0.12,
                child: IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                      SafeArea(
                        child: Container(
                          color: Colors.white,
                          child: new Wrap(
                            children: <Widget>[
                              new ListTile(
                                  leading: new Icon(Icons.photo_library),
                                  title: new Text("Gallery".tr),
                                  onTap: () {
                                    _imgFromGallery();
                                    Navigator.of(context).pop();
                                  }),
                              new ListTile(
                                leading: new Icon(Icons.photo_camera),
                                title: new Text("Camera".tr),
                                onTap: () {
                                  _imgFromCamera();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    )
                  ],
                  color: Get.theme.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.39,
              left: screenWidth * 0.05,
              right: screenHeight * 0.05,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: screenWidth * 0.9,
                      child: Obx(
                        () => MyTextFormField(
                          hintText: "Full_Name".tr,
                          validator: (String value) {
                            if (value.length == 0) return null;

                            if (!nameRegex.hasMatch(value)) {
                              return "Please_enter_a_valid_full_name".tr;
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            if (value.length != 0)
                              userController.changeName(value);
                          },
                          tapped: controller.nameTapped.value,
                          onTap: () {
                            controller.nameTapped.value = true;
                            controller.emailTapped.value = false;
                            controller.phoneTapped.value = false;
                          },
                          onFieldSubmitted: (value) {
                            if (value.length == 0)
                              controller.nameTapped.value = false;
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      child: Obx(
                        () => MyTextFormField(
                          hintText: "Email".tr,
                          isEmail: true,
                          validator: (String value) {
                            if (value.length == 0) return null;
                            if (!validator.isEmail(value)) {
                              return "Please_enter_a_valid_email".tr;
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            if (value.length != 0)
                              userController.changeEmail(value);
                          },
                          tapped: controller.emailTapped.value,
                          onTap: () {
                            controller.nameTapped.value = false;
                            controller.emailTapped.value = true;
                            controller.phoneTapped.value = false;
                          },
                          onFieldSubmitted: (value) {
                            if (value.length == 0)
                              controller.emailTapped.value = false;
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      child: Obx(
                        () => MyTextFormField(
                          hintText: "Phone_number".tr,
                          validator: (String value) {
                            if (value.length == 0) return null;

                            if (!phoneRegex.hasMatch(value)) {
                              return "Please_enter_a_valid_phone_number".tr;
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            if (value.length != 0)
                              userController.changePhone(value);
                            // userController.refresh();
                          },
                          tapped: controller.phoneTapped.value,
                          onTap: () {
                            controller.phoneTapped.value = true;
                            controller.emailTapped.value = false;
                            controller.nameTapped.value = false;
                          },
                          onFieldSubmitted: (value) {
                            if (value.length == 0)
                              controller.phoneTapped.value = false;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.025,
                    ),
                    Container(
                      height: screenHeight * 0.08,
                      width: screenWidth * 0.9,
                      child: RaisedButton(
                        color: Get.theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () {
                          controller.nameTapped.value = false;
                          controller.emailTapped.value = false;
                          controller.phoneTapped.value = false;
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();

                            Get.back();
                          }
                        },
                        child: Text(
                          "Save".tr,
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
          ],
        ),
      ),
    );
  }

  _imgFromGallery() async {
    var picker = ImagePicker();
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    userController.changeAvatar(pickedFile.path);
  }

  _imgFromCamera() async {
    var picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    userController.changeAvatar(pickedFile.path);
  }
}
