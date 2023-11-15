import 'package:auth_test_app/app/data/services/user_services.dart';
import 'package:auth_test_app/app/modules/profilePage/views/profile_page_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  int selectedIndex = 4;
  List<Widget> pages = const [
    SizedBox.shrink(),
    SizedBox.shrink(),
    SizedBox.shrink(),
    ProfilePageView(),
    ProfilePageView(),
  ];

  onItemTapped(int value) {
    selectedIndex = value;
    update();
  }

  @override
  void onReady() {
    init();
    super.onReady();
  }

  init() async {
    await UserService.find.getLocalUser();
  }
}
