import 'package:auth_test_app/app/data/services/user_services.dart';
import 'package:auth_test_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    init();
    super.onReady();
  }

  init() async {
    await UserService.find.getLocalUser();
    if (UserService.find.user != null) {
      Get.toNamed(Routes.ROOT);
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        Get.toNamed(Routes.LOGIN_WITH_SOCIAL);
      });
    }
  }
}
