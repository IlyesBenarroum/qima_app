import 'package:get/get.dart';
import '../../../../app/modules/home/home_view.dart';

class OnBoardingController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 5)).then(
      (value) => Get.off(
        HomeView(),
      ),
    );
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
