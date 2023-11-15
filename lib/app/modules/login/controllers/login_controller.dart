import 'package:auth_test_app/app/data/model/model_user.dart';
import 'package:auth_test_app/app/data/storage_method.dart';
import 'package:auth_test_app/app/modules/loginWithSocial/controllers/login_with_social_controller.dart';
import 'package:auth_test_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginWithSocialController socialController = Get.isRegistered<LoginWithSocialController>() ? Get.find() : Get.put(LoginWithSocialController());

  //Function to login with email and password
  login() async {
    EasyLoading.show(status: 'loading...');
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
      EasyLoading.dismiss();
      if (userCredential.user != null) {
        var user = ModelUser(email: userCredential.user?.email, name: userCredential.user?.displayName, photo: userCredential.user?.photoURL);
        StorageMethod.saveUserToLocal(user);
        Get.snackbar(
          "Selamat",
          "Berhasil Login",
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
        );
        Get.toNamed(Routes.ROOT);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Gagal",
          "No user found for that email",
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Gagal",
          "Wrong password provided for that user.",
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
        );
      } else {
        Get.snackbar(
          "Gagal",
          "Gagal login",
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
        );
      }
    }
  }
}
