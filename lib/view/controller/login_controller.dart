import 'package:eclarios/models/user_model.dart';
import 'package:eclarios/view/controller/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../screens/launch/loginsuccess_screen.dart';
import '../user_preference/user_preference.dart';

class LoginController extends GetxController {
  final passwordController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  UserPreferences userPreferences = UserPreferences();
  final _api = LoginRepository();

  void loginApi() {
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };

    _api.LoginApi(data).then((value) {
      // islogin.value = true;
      // box.write('loginuser', islogin.value);

      //manage user session by shared preference
      userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
        Get.offAll(LoginSuccessScreen());
        Utils.snackBar('Login', "User Login Successfull");
      }).onError((error, stackTrace) {});

/*
        Utils.snackBar('Login', "User Login Successfull");
         Get.to(HomeScreen());
         */
    }).onError((error, stackTrace) {
      print(error.toString());
      Utils.snackBar("Error", "User Not Found, Invalid Email or Password");
      // islogin.value = false;
    });
  }
}
