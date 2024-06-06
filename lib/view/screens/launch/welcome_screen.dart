import 'package:eclarios/constants/app_colors.dart';
import 'package:eclarios/constants/app_fonts.dart';
import 'package:eclarios/view/screens/auth/login/login.dart';
import 'package:eclarios/view/widget/common_image_view_widget.dart';
import 'package:eclarios/view/widget/my_text_widget.dart';
import 'package:eclarios/view/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          CommonImageView(
            imagePath: "assets/images/welcomescreen.png",
          ),
          Positioned(
            top: mqh * 0.60,
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Transforming ',
                          style: TextStyle(
                              fontSize: mqw * 0.055,
                              color: kTextColor1,
                              fontFamily: AppFonts.InterMedium,
                              fontStyle: FontStyle.italic)),
                      TextSpan(
                          text: 'Lives\n',
                          style: TextStyle(
                              fontSize: mqw * 0.055,
                              color: kTextColor,
                              fontFamily: AppFonts.InterMedium)),
                      TextSpan(
                          text: 'Through ',
                          style: TextStyle(
                              fontSize: mqw * 0.055,
                              color: kTextColor1,
                              fontFamily: AppFonts.InterMedium,
                              fontStyle: FontStyle.italic)),
                      TextSpan(
                          text: 'Innovative Medicine',
                          style: TextStyle(
                              fontSize: mqw * 0.055,
                              color: kTextColor,
                              fontFamily: AppFonts.InterMedium)),
                    ],
                  ),
                ),
                SizedBox(
                  height: mqw * 0.06,
                ),
                MyText(
                  text:
                      "Nikhil Aggarwa a prominent figure in the pharmaceutical industry, was recently\n awarded by the Honorable Minister S. Navjot Singh Sidhu, Minister of Local\n Government, Tourism and Cultural Affairs of Punjab, for his outstanding\n contributions and achievements in the field.",
                  textAlign: TextAlign.center,
                  size: mqw * 0.02,
                  fontFamily: AppFonts.InterRegular,
                ),
                SizedBox(
                  height: mqw * 0.14,
                ),
                RoundButton(
                  onpressed: () {
                    Get.to(LoginScreen(),
                        transition: Transition.leftToRightWithFade,
                        duration: Duration(milliseconds: 500));
                  },
                  width: mqw * 0.55,
                  height: mqw * 0.095,
                  text: "Next",
                  backgroundcolor: kTextColor1,
                  icon: Icons.arrow_forward_outlined,
                  size: mqw * 0.05,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
