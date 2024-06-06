import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var isActive = false.obs;
  var isforgetActive = false.obs;
  var isobsecure = true.obs;
  var ispasswordobsecure = true.obs;
  final TextEditingController loginpasswordcontroller = TextEditingController();
  final TextEditingController signuppasswordcontroller =
      TextEditingController();
  final TextEditingController searchController = TextEditingController();
  RxInt value = 1.obs;

  void increaseValue() {
    value.value++;
  }

  void decreaseValue() {
    value.value--;
  }

  void toggleRememberCheckBox() {
    isActive.value = !isActive.value;
  }

  void toggleForgetCheckBox() {
    isforgetActive.value = !isforgetActive.value;
  }

  void toggleobsecure() {
    isobsecure.value = !isobsecure.value;
  }

  void togglepasswordobsecure() {
    ispasswordobsecure.value = !ispasswordobsecure.value;
  }

  void clearSearchField(TextEditingController searchController) {
    searchController.clear();
  }
}
