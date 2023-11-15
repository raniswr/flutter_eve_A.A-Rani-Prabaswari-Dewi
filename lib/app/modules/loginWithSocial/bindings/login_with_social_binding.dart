import 'package:get/get.dart';

import '../controllers/login_with_social_controller.dart';

class LoginWithSocialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginWithSocialController>(
      () => LoginWithSocialController(),
    );
  }
}
