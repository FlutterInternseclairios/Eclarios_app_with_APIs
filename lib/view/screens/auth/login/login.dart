import 'package:eclarios/constants/app_colors.dart';
import 'package:eclarios/constants/app_fonts.dart';
import 'package:eclarios/view/controller/checkbox_controller.dart';
import 'package:eclarios/view/controller/login_controller.dart';
import 'package:eclarios/view/screens/Bottombar/bottom_bar_page.dart';
import 'package:eclarios/view/screens/auth/register/signup.dart';
import 'package:eclarios/view/screens/launch/loginsuccess_screen.dart';
import 'package:eclarios/view/widget/custom_check_box_widget.dart';
import 'package:eclarios/view/widget/my_text_widget.dart';
import 'package:eclarios/view/widget/my_textfeild.dart';
import 'package:eclarios/view/widget/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../widget/common_image_view_widget.dart';

class LoginScreen extends StatelessWidget {
  final CheckboxController checkboxController = Get.put(CheckboxController());
  final LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CommonImageView(
            imagePath: "assets/images/loginscreen.png",
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: mqw * 0.1, right: mqw * 0.1,
                //top: mqh * 0.1
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonImageView(
                      imagePath: "assets/images/logo.png",
                      width: mqw * 0.5,
                    ),
                    SizedBox(
                      height: mqh * 0.10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Welcome",
                          size: mqw * 0.036,
                          fontFamily: AppFonts.InterRegular,
                          fontStyle: FontStyle.italic,
                          color: kTextColor1,
                        ),
                        SizedBox(
                          width: mqw * 0.01,
                        ),
                        MyText(
                          text: "Eclarios",
                          size: mqw * 0.036,
                          fontFamily: AppFonts.InterMedium,
                          color: kTextColor1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: mqh * 0.02,
                    ),
                    MyTextfeild(
                      icon: Icons.email,
                      controller: loginController.emailController.value,
                    ),
                    SizedBox(
                      height: mqh * 0.01,
                    ),
                    Obx(
                      () => MyTextfeild(
                        icon: Icons.lock,
                        controller: loginController.passwordController.value,
                        obsecuretext: checkboxController.isobsecure.value,
                        suffixIcon: InkWell(
                          onTap: () {
                            checkboxController.toggleobsecure();
                          },
                          child: Icon(
                            checkboxController.isobsecure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mqh * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => CustomCheckBox(
                              isActive: checkboxController.isActive.value,
                              onTap: () {
                                checkboxController.toggleRememberCheckBox();
                              }),
                        ),
                        SizedBox(
                          width: mqw * 0.01,
                        ),
                        Expanded(
                          child: MyText(
                            text: "Remember me",
                            size: mqw * 0.026,
                            fontFamily: AppFonts.InterRegular,
                            color: kTextColor1,
                          ),
                        ),
                        Obx(
                          () => CustomCheckBox(
                              isActive: checkboxController.isforgetActive.value,
                              onTap: () {
                                checkboxController.toggleForgetCheckBox();
                              }),
                        ),
                        SizedBox(
                          width: mqw * 0.01,
                        ),
                        MyText(
                          text: "Forget Password",
                          size: mqw * 0.026,
                          fontFamily: AppFonts.InterRegular,
                          color: kTextColor1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mqh * 0.07,
                    ),
                    RoundButton(
                      onpressed: () {
                        loginController.loginApi();
                        // Get.offAll(LoginSuccessScreen(),
                        //     transition: Transition.leftToRightWithFade,
                        //     duration: Duration(milliseconds: 500));
                      },
                      text: "Login",
                      fontSize: mqw * 0.035,
                      backgroundcolor: kTextColor,
                      width: mqw * 0.6,
                      icon: Icons.arrow_forward_outlined,
                      size: mqw * 0.05,
                    ),
                    SizedBox(
                      height: mqh * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CommonImageView(
                            imagePath:
                                "assets/images/Facebook-removebg-preview.png",
                            height: mqw * 0.1,
                          ),
                        ),
                        SizedBox(
                          width: mqw * 0.02,
                        ),
                        InkWell(
                          onTap: () {},
                          child: CommonImageView(
                            imagePath:
                                "assets/images/Instagram-removebg-preview.png",
                            height: mqw * 0.1,
                          ),
                        ),
                        SizedBox(
                          width: mqw * 0.02,
                        ),
                        InkWell(
                          onTap: () {},
                          child: CommonImageView(
                            imagePath:
                                "assets/images/linkedin-removebg-preview.png",
                            height: mqw * 0.1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mqh * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RoundButton(
                          onpressed: () {
                            Get.to(SignupScreen(),
                                transition: Transition.leftToRightWithFade,
                                duration: Duration(milliseconds: 500));
                          },
                          text: "SignUp",
                          fontSize: mqw * 0.032,
                          width: mqw * 0.3,
                          height: mqw * 0.07,
                          backgroundcolor: kTextColor1,
                          icon: Icons.arrow_forward_outlined,
                          size: mqw * 0.05,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
