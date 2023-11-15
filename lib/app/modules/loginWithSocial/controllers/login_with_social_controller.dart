import 'dart:async';
import 'dart:developer';

import 'package:auth_test_app/app/data/model/model_user.dart';
import 'package:auth_test_app/app/data/storage_method.dart';
import 'package:auth_test_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ["email", "openid", "https://www.googleapis.com/auth/cloudplatformprojects.readonly", "https://www.googleapis.com/auth/firebase", "https://www.googleapis.com/auth/cloud-platform"],
);

class LoginWithSocialController extends GetxController {
  //Function to login with google
  Future<void> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      var userSignIn = await _googleSignIn.signIn();
      if (userSignIn != null) {
        AuthCredential? credential;
        try {
          final GoogleSignInAuthentication goodleSignInAuthentication = await userSignIn.authentication;
          credential = GoogleAuthProvider.credential(
            accessToken: goodleSignInAuthentication.accessToken,
            idToken: goodleSignInAuthentication.idToken,
          );
        } catch (e) {
          log("Error get credentials: $e");
        }
        if (credential != null) {
          final UserCredential userCredential = await auth.signInWithCredential(credential);
          var user = userCredential.user;
          var userModel = ModelUser(email: user?.email, name: user?.displayName, photo: user?.photoURL);
          StorageMethod.saveUserToLocal(userModel);
          Get.toNamed(Routes.ROOT);
        }
      }
      userSignIn?.clearAuthCache();
    } catch (error) {
      log("Error handle sign in google ${error.toString()}");
    }
  }

  //Function to sign in with facebook
  Future signInWithFacebook() async {
    await Permission.storage.request();
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.accessToken?.token != null) {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken?.token ?? '');

      // Once signed in, return the UserCredential
      var credential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      if (credential.user != null) {
        var userModel = ModelUser(email: credential.user?.email, name: credential.user?.displayName, photo: credential.user?.photoURL);
        StorageMethod.saveUserToLocal(userModel);
        Get.toNamed(Routes.ROOT);
      }
    }
  }
}
