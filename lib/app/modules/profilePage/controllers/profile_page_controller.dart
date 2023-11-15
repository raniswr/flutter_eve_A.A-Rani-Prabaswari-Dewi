import 'package:auth_test_app/app/data/services/user_services.dart';
import 'package:auth_test_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  UserService userService = Get.find();

  logout() async {
    await FirebaseAuth.instance.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    googleSignOut();
    Get.toNamed(Routes.LOGIN);
  }

  googleSignOut() {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      googleSignIn.disconnect();
    } catch (_) {}
  }
}
