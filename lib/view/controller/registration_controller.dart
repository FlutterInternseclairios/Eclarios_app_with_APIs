import 'dart:convert';

import 'package:eclarios/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../screens/auth/login/login.dart';

class RegistrationController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  var isEmailValid = false.obs;
  var isFormValid = false.obs;

  void isValidEmail(String email) {
    String emailRegex = r'^(?=.*[A-Z])(?=.*\d)[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(emailRegex);
    isEmailValid.value = regExp.hasMatch(email);
    validateForm();
  }

  void validateForm() {
    isFormValid.value = nameController.value.text.isNotEmpty &&
        emailController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty &&
        isEmailValid.value;
  }

  void SignUp() async {
    try {
      Map<String, dynamic> newData = {
        'name': nameController.value.text,
        'email': emailController.value.text,
        'password': passwordController.value.text
      };

      final response = await post(
        Uri.parse("https://myeclapi.000webhostapp.com/users/create.php"
            //"http://10.0.2.2/add_product_api_practice/users/create.php"
            ),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(newData),
      );

      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 201) {
        print("Account created successfully");
        Utils.snackBar(
          "Success",
          "User Successfully created",
        );
        Get.offAll(LoginScreen(),
            transition: Transition.leftToRightWithFade,
            duration: Duration(milliseconds: 500));
      } else {
        String errorMessage = data['message'] ?? 'An error occurred';
        Utils.snackBar("Failed", errorMessage);
      }
    } catch (err) {
      Utils.snackBar("Error", err.toString());
    }
  }
}
