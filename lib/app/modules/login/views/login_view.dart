import 'package:auth_test_app/app/routes/app_pages.dart';
import 'package:auth_test_app/constant/colors.dart';
import 'package:auth_test_app/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/image/logo_sign.png",
              height: 300,
              width: 300,
            ),
            Text(
              'Sign in for free',
              style: AppStyles.styleTextBody20(fontWeight: FontWeight.bold),
            ),
            GetBuilder<LoginController>(builder: (controller) {
              return Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: AppStyles.styleTextBody16(fontWeight: FontWeight.bold),
                    ).marginAll(5),
                    TextField(
                      decoration: AppStyles.inputDecorationFloating("Enter your email"),
                      controller: controller.usernameController,
                    ),
                    Text(
                      'Password',
                      style: AppStyles.styleTextBody16(fontWeight: FontWeight.bold),
                    ).marginAll(5),
                    TextField(
                      decoration: AppStyles.inputDecorationFloating("Enter your password", suffixIcon: const Icon(Icons.remove_red_eye_sharp)),
                      obscureText: true,
                      controller: controller.passwordController,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.login();
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(AppColors.bg),
                            textStyle: MaterialStateProperty.all(AppStyles.styleTextBody18()),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))),
                        child: Text(
                          "Sign in",
                          style: AppStyles.styleTextBody16(colorText: AppColors.white),
                        ),
                      ),
                    ).marginOnly(top: 20),
                  ],
                ),
              ).marginAll(15);
            }),
            Column(
              children: [
                Text(
                  'or continue with',
                  style: AppStyles.styleTextBody16(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.socialController.signInWithFacebook();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grayMedium, width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset(
                          "assets/image/facebook.png",
                          height: 10,
                          width: 10,
                        ),
                      ).marginSymmetric(horizontal: 10),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.socialController.signInWithGoogle();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grayMedium, width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset(
                          "assets/image/google.png",
                          height: 10,
                          width: 10,
                        ),
                      ),
                    )
                  ],
                ).marginSymmetric(vertical: 10)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account?',
                  style: AppStyles.styleTextBody14(colorText: AppColors.grayDark),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child: Text(
                    ' Sign Up',
                    style: AppStyles.styleTextBody14(colorText: AppColors.bg, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
