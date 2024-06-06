import 'package:eclarios/constants/app_colors.dart';
import 'package:eclarios/constants/app_fonts.dart';
import 'package:eclarios/utils/utils.dart';
import 'package:eclarios/view/controller/checkbox_controller.dart';
import 'package:eclarios/view/controller/registration_controller.dart';
import 'package:eclarios/view/screens/auth/login/login.dart';
import 'package:eclarios/view/widget/custom_check_box_widget.dart';
import 'package:eclarios/view/widget/my_text_widget.dart';
import 'package:eclarios/view/widget/my_textfeild.dart';
import 'package:eclarios/view/widget/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../widget/common_image_view_widget.dart';

class SignupScreen extends StatelessWidget {
  final CheckboxController checkboxController = Get.put(CheckboxController());
  final RegistrationController registrationController =
      Get.put(RegistrationController());

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
                left: mqw * 0.1,
                right: mqw * 0.1,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonImageView(
                      imagePath: "assets/images/logo.png",
                      width: 200,
                    ),
                    SizedBox(
                      height: mqh * 0.10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Welcome",
                          size: 15,
                          fontFamily: AppFonts.InterRegular,
                          fontStyle: FontStyle.italic,
                          color: kTextColor1,
                        ),
                        SizedBox(
                          width: mqw * 0.01,
                        ),
                        MyText(
                          text: "Eclarios",
                          size: 15,
                          fontFamily: AppFonts.InterMedium,
                          color: kTextColor1,
                        )
                      ],
                    ),
                    SizedBox(
                      height: mqh * 0.02,
                    ),
                    MyTextfeild(
                      icon: Icons.person,
                      controller: registrationController.nameController,
                      onChanged: (value) {
                        registrationController.validateForm();
                      },
                    ),
                    SizedBox(
                      height: mqh * 0.01,
                    ),
                    Obx(() => MyTextfeild(
                          icon: Icons.email,
                          hintText: "Test1@gmail.com",
                          controller: registrationController.emailController,
                          onChanged: (value) {
                            registrationController.isValidEmail(value);
                          },
                          suffixIcon: Icon(
                            Icons.check_circle_outline,
                            color: registrationController.isEmailValid.value
                                ? Colors.green
                                : Colors.red,
                          ),
                        )),
                    SizedBox(
                      height: mqh * 0.01,
                    ),
                    Obx(() => MyTextfeild(
                          icon: Icons.lock,
                          controller: registrationController.passwordController,
                          obsecuretext:
                              checkboxController.ispasswordobsecure.value,
                          onChanged: (value) {
                            registrationController.validateForm();
                          },
                          suffixIcon: InkWell(
                            onTap: () {
                              checkboxController.togglepasswordobsecure();
                            },
                            child: Icon(
                              checkboxController.ispasswordobsecure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: mqh * 0.07,
                    ),
                    Obx(() => RoundButton(
                          onpressed: registrationController.isFormValid.value
                              ? () {
                                  registrationController.SignUp();
                                }
                              : () {
                                  null;
                                },
                          text: "SignUp",
                          fontSize: mqw * 0.035,
                          backgroundcolor:
                              registrationController.isFormValid.value
                                  ? kTextColor
                                  : Colors.grey,
                          width: mqw * 0.6,
                          icon: Icons.arrow_forward_outlined,
                          size: mqw * 0.05,
                        )),
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
                      height: mqh * 0.08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RoundButton(
                          onpressed: () {
                            Get.offAll(LoginScreen(),
                                transition: Transition.leftToRightWithFade,
                                duration: Duration(milliseconds: 500));
                          },
                          text: "Login",
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
