import 'package:eclarios/constants/app_colors.dart';
import 'package:eclarios/constants/app_fonts.dart';
import 'package:eclarios/view/screens/Bottombar/bottom_bar_page.dart';
import 'package:eclarios/view/screens/home/home_screen.dart';
import 'package:eclarios/view/widget/common_image_view_widget.dart';
import 'package:eclarios/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/round_button.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CommonImageView(
            imagePath: "assets/images/loginsuccess.png",
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: mqh * 0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Welcome ',
                            style: TextStyle(
                                fontSize: 24,
                                color: kTextColor1,
                                fontFamily: AppFonts.InterMedium,
                                fontStyle: FontStyle.italic)),
                        TextSpan(
                            text: 'To\n',
                            style: TextStyle(
                                fontSize: 24,
                                color: kTextColor,
                                fontFamily: AppFonts.InterMedium)),
                        TextSpan(
                            text: 'Eclarios ',
                            style: TextStyle(
                                fontSize: 24,
                                color: kTextColor1,
                                fontFamily: AppFonts.InterMedium,
                                fontStyle: FontStyle.italic)),
                        TextSpan(
                            text: 'App',
                            style: TextStyle(
                                fontSize: 24,
                                color: kTextColor,
                                fontFamily: AppFonts.InterMedium)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mqh * 0.1,
                  ),
                  RoundButton(
                    onpressed: () {
                      Get.to(BottomBarPage(),
                          transition: Transition.leftToRightWithFade,
                          duration: Duration(milliseconds: 500));
                    },
                    width: mqw * 0.5,
                    height: mqw * 0.095,
                    text: "Next",
                    backgroundcolor: kTextColor1,
                    icon: Icons.arrow_forward_outlined,
                    size: mqw * 0.05,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
