import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:qima/app/tools/tools.dart';

class SignupformController extends GetxController {
  var nameTapped = false.obs;
  var emailTapped = false.obs;
  var phoneTapped = false.obs;
  var passwordTapped = false.obs;

  var accept = false.obs;

GraphQLClient  _client  = clientToQuery();



  @override
  void onInit() {
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }
 
}

