import 'package:auth_test_app/app/routes/app_pages.dart';
import 'package:auth_test_app/constant/colors.dart';
import 'package:auth_test_app/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_with_social_controller.dart';

class LoginWithSocialView extends GetView<LoginWithSocialController> {
  const LoginWithSocialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginWithSocialController>(builder: (controller) {
      return Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image/welcome.png",
            height: 220,
            width: 220,
          ),
          Text(
            'Lets you in',
            style: AppStyles.styleTextBody25(fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  controller.signInWithFacebook();
                },
                child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGrey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/image/facebook.png",
                        ).marginAll(10).marginOnly(left: 15),
                        Text(
                          'Facebook',
                          style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )).marginAll(10),
              ),
              InkWell(
                onTap: () async {
                  controller.signInWithGoogle();
                },
                child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGrey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/image/google.png",
                        ),
                        Text(
                          'Google',
                          style: AppStyles.styleTextBody14(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )).marginAll(10),
              ),
            ],
          ),
          Text(
            'or',
            style: AppStyles.styleTextBody18(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.LOGIN);
              },
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(AppStyles.styleTextBody18()),
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.bg),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)))),
              child: Text(
                "Sign in with password",
                style: AppStyles.styleTextBody16(colorText: AppColors.white),
              ),
            ),
          ).marginAll(20),
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
      ));
    });
  }
}
