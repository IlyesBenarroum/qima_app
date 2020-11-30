import 'package:get/get.dart';
import 'package:qima/app/controllers/auction_controller.dart';
import 'package:qima/app/controllers/user_controller.dart';
import 'package:qima/app/models/user_model.dart';
import 'package:qima/app/modules/registration/registration_view.dart';
import '../../../app/modules/home/home_view.dart';
import 'package:get_storage/get_storage.dart';

// import '../../../app/modules/OnBoarding/views/on_boarding_view.dart';
// import '../registration/registration_view.dart';
final box = GetStorage();
bool boxbll;
User userS = User();
final UserController userController = Get.put(UserController());



class SplashController extends GetxController {
  AuctionController controller = Get.put(AuctionController());
  @override
  void onInit() async {
    bool _seen = (box.read('seen') ?? false);

    if (box.read('SignUp') != null) {

      userS.id = box.read('id');
      userS.name = box.read('fullName');
      userS.email = box.read('email');

      print(userS.id);



      boxbll = true;
    } else {
      print('makhadmatch');
      boxbll = false;
    }
    if (_seen) {
      Future.delayed(Duration(seconds: 4)).then(
        (value) => Get.off(
          HomeView(),
        ),
      );
    } else {
      await box.write('seen', true);
      if (box.read('SignUp') != null) {
        print('khadmat');
        boxbll = true;
      } else {
        boxbll = false;
        print('makhadmatch');
      }
      Future.delayed(Duration(seconds: 4)).then(
        (value) => Get.off(
          HomeView(),
        ),
      );
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}