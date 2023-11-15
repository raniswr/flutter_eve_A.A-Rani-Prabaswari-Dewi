import 'dart:convert';
import 'dart:developer';

import 'package:auth_test_app/app/data/model/model_user.dart';
import 'package:auth_test_app/app/data/storage_name.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends GetxService {
  ModelUser? user;

  getLocalUser() async {
    user = null;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString(StorageName.userKey);
    try {
      user = ModelUser.fromJson(json.decode(userData.toString()));
    } catch (e) {
      log("failed to encode user data: $e");
    }
  }

  static UserService get find => Get.find();
}
