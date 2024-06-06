import 'dart:async';
import 'package:eclarios/constants/app_colors.dart';
import 'package:eclarios/view/screens/launch/welcome_screen.dart';
import 'package:eclarios/view/widget/common_image_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/splashscreen_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.isuserlogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: CommonImageView(
          imagePath: "assets/images/logo.png",
          width: 300,
        ),
      ),
    );
  }
}
