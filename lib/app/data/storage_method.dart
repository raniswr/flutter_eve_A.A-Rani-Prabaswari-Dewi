import 'dart:convert';

import 'package:auth_test_app/app/data/model/model_user.dart';
import 'package:auth_test_app/app/data/storage_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageMethod {
  static saveUserToLocal(ModelUser user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageName.userKey, json.encode(user.toJson()));
  }
}
