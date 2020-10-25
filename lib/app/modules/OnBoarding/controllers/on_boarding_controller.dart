import 'package:get/get.dart';
import '../../../../app/modules/home/home_view.dart';
import '../../registration/registration_view.dart';

class OnBoardingController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 5)).then(
      (value) => Get.off(
        RegistrationView(),
      ),
    );
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
