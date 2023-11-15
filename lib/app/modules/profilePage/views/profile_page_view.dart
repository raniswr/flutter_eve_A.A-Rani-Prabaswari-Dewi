import 'package:auth_test_app/constant/colors.dart';
import 'package:auth_test_app/constant/styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(builder: (controller) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: AppColors.bottomnav,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Image.asset(
                  "assets/image/logo.png",
                  height: 30,
                  width: 30,
                ),
                Text('Profile', style: AppStyles.styleTextBody20(fontWeight: FontWeight.bold)),
              ],
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: <Widget>[
              GestureDetector(
                onTap: controller.logout,
                child: Container(
                  height: 10,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.buttonBg,
                  ),
                  child: const Icon(
                    Icons.logout,
                    color: AppColors.bg,
                  ),
                ).marginAll(10),
              ),
              Container(
                height: 10,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.buttonBg,
                ),
                child: const Icon(
                  Icons.more_vert_sharp,
                  color: AppColors.bg,
                ),
              ).marginAll(10),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      padding: const EdgeInsets.all(8),
                      color: AppColors.bottomnav,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(230),
                              child: InkWell(
                                onTap: () {},
                                child: controller.userService.user?.photo != null
                                    ? Image.network(
                                        controller.userService.user?.photo ?? '',
                                        width: 130,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        "assets/image/profil.png",
                                        width: 130,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                          Container(
                              width: 32,
                              height: 32,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: AppColors.bg),
                              child: const Icon(
                                Icons.edit,
                                color: AppColors.white,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  controller.userService.user?.name ?? controller.userService.user?.email ?? "-",
                  style: AppStyles.styleTextBody25(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '12',
                            style: AppStyles.styleTextBody25(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Fundraising',
                            style: AppStyles.styleTextBody16(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '130',
                            style: AppStyles.styleTextBody25(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Followers',
                            style: AppStyles.styleTextBody16(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '126',
                            style: AppStyles.styleTextBody25(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Following',
                            style: AppStyles.styleTextBody16(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.buttonBg,
                        ),
                        child: const Icon(
                          Icons.wallet,
                          color: AppColors.bg,
                        ),
                      ).marginAll(10),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '4234',
                            style: AppStyles.styleTextBody20(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'My Wallet',
                            style: AppStyles.styleTextBody14(colorText: AppColors.grayMedium),
                          ),
                        ],
                      )),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.bg, width: 2),
                          color: AppColors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Top Up',
                            style: AppStyles.styleTextBody18(colorText: AppColors.bg, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ).marginAll(10),
                    ],
                  ),
                ).marginAll(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: AppStyles.styleTextBody18(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Lorem ipsum about Lorem ipsum about Lorem ipsum about Lorem ipsum about Lorem ipsum aboutLorem ipsum about',
                      style: AppStyles.styleTextBody16(),
                    ),
                  ],
                ).marginAll(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Interest',
                          style: AppStyles.styleTextBody18(fontWeight: FontWeight.bold),
                        ).marginOnly(right: 5),
                        const Icon(
                          Icons.edit,
                          size: 20,
                          color: AppColors.bg,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.bg, width: 2),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Medical',
                              style: AppStyles.styleTextBody16(colorText: AppColors.bg, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.bg, width: 2),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Disaster',
                              style: AppStyles.styleTextBody16(colorText: AppColors.bg, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ).marginSymmetric(horizontal: 5),
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.bg, width: 2),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Education',
                              style: AppStyles.styleTextBody16(colorText: AppColors.bg, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.bg, width: 2),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Social',
                              style: AppStyles.styleTextBody16(colorText: AppColors.bg, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ).marginSymmetric(horizontal: 5),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.bg, width: 2),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Humanity',
                              style: AppStyles.styleTextBody16(colorText: AppColors.bg, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.bg, width: 2),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Environtment',
                              style: AppStyles.styleTextBody16(colorText: AppColors.bg, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ).marginSymmetric(horizontal: 5),
                      ],
                    ).marginOnly(top: 5)
                  ],
                ).marginAll(15),
              ],
            ),
          ),
        ),
      );
    });
  }
}
