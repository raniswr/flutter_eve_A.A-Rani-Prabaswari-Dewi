import 'package:auth_test_app/app/modules/loginWithSocial/controllers/login_with_social_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginWithSocialController socialController = Get.isRegistered<LoginWithSocialController>() ? Get.find() : Get.put(LoginWithSocialController());

  register() async {
    if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
        Get.snackbar(
          "Selamat",
          "Berhasil Register",
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar(
            "Gagal",
            "The password provided is too weak.",
            snackPosition: SnackPosition.TOP,
            borderRadius: 10,
          );
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
            "Gagal",
            "The account already exists for that email.",
            snackPosition: SnackPosition.TOP,
            borderRadius: 10,
          );
        }
      } catch (e) {
        Get.snackbar(
          "Gagal",
          " Gagal register",
          snackPosition: SnackPosition.TOP,
          borderRadius: 10,
        );
      }
    }
  }
}
