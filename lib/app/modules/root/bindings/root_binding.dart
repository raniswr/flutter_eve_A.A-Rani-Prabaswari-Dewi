import 'package:auth_test_app/app/modules/profilePage/controllers/profile_page_controller.dart';
import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut<ProfilePageController>(
      () => ProfilePageController(),
    );
  }
}
