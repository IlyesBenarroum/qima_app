import 'package:get/get.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  var user = User(
    name: "",
    email: "",
    phone: "",
    password: "",
    avatar: "",
  ).obs;
  get name => user.value.name;
  get email => user.value.email;
  get phone => user.value.phone;
  get password => user.value.password;
  get avatar => user.value.avatar;
  void changeName(name) {
    user.value.name = name;
    user.refresh();
  }

  void changeEmail(email) {
    user.value.email = email;
    user.refresh();
  }

  void changePhone(phone) {
    user.value.phone = phone;
    user.refresh();
  }

  void changePassword(password) {
    user.value.password = password;
    user.refresh();
  }

  void changeAvatar(avatar) {
    user.value.avatar = avatar;
    user.refresh();
  }
  // update();

  // @override
  // void onInit() {}

  // @override
  // void onReady() {}

  // @override
  // void onClose() {}

}
