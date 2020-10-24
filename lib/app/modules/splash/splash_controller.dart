import 'package:get/get.dart';
import '../../../app/modules/home/home_view.dart';
import 'package:get_storage/get_storage.dart';
import '../../../app/modules/OnBoarding/views/on_boarding_view.dart';
import '../../../app/modules/signup/signup_view.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  @override
  void onInit() async {
    bool _seen = (box.read('seen') ?? false);

    if (_seen) {
      Future.delayed(Duration(seconds: 4)).then(
        (value) => Get.off(
          SignupView(),
        ),
      );
    } else {
      await box.write('seen', true);
      Future.delayed(Duration(seconds: 4)).then(
        (value) => Get.off(
          SignupView(),
        ),
      );
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
