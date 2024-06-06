import 'package:eclarios/view/controller/registration_controller.dart';
import 'package:get/get.dart';

class Utils extends GetxController {
  static snackBar(String title, String message) {
    Get.snackbar(title, message);
  }
}
