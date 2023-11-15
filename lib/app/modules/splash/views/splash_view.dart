import 'package:auth_test_app/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image/splash_logo.png",
            height: 300,
            width: 300,
          ).paddingSymmetric(horizontal: 10),
          const SpinKitRing(
            color: AppColors.grayDark,
            size: 50.0,
          ),
        ],
      ),
    );
  }
}
