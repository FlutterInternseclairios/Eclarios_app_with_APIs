import 'dart:async';
import 'package:eclarios/view/screens/Bottombar/bottom_bar_page.dart';
import 'package:eclarios/view/screens/auth/login/login.dart';
import 'package:eclarios/view/screens/home/home_screen.dart';
import 'package:eclarios/view/screens/launch/welcome_screen.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../user_preference/user_preference.dart';

class SplashServices extends GetxController {
  //user seesion by getstorage

  /* 
  final GetStorage box = GetStorage();
  @override
  void onReady() {
    var user = box.read('loginuser');
    print(user);
    if (user != null && user == true) {
      Get.toNamed(RoutesName.homeScreen);
    } else {
      Get.toNamed(RoutesName.loginScreen);
    }
    super.onReady();
  }
  */

  UserPreferences userPreferences = UserPreferences();

  void isuserlogin() {
    userPreferences.getUser().then((value) {
      // print(value.token);

      if (value.token == null || value.token!.isEmpty) {
        Timer(const Duration(seconds: 3), () => Get.offAll(WelcomeScreen()));
      } else {
        Timer(const Duration(seconds: 3), () => Get.offAll(BottomBarPage()));
      }
    }).onError((error, stackTrace) {});
  }
}
