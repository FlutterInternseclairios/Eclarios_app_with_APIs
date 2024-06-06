import 'package:eclarios/constants/app_colors.dart';
import 'package:eclarios/constants/app_fonts.dart';
import 'package:eclarios/view/widget/common_image_view_widget.dart';
import 'package:eclarios/view/widget/my_text_widget.dart';
import 'package:eclarios/view/widget/profilebutton_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../user_preference/user_preference.dart';
import '../auth/login/login.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  UserPreferences userPreferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mqw * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: "Account Settings",
                size: mqw * 0.030,
                fontFamily: AppFonts.InterSemiBold,
              ),
              SizedBox(
                height: mqh * 0.06,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(mqw * 0.03),
                child: CommonImageView(
                  imagePath: "assets/images/profiledoctor.jpg",
                  height: mqh * 0.17,
                  width: mqw * 0.32,
                ),
              ),
              SizedBox(
                height: mqh * 0.01,
              ),
              MyText(
                text: "Mr. Distributor",
                fontFamily: AppFonts.InterMedium,
                size: mqw * 0.035,
                lineHeight: 1,
              ),
              SizedBox(
                height: mqh * 0.01,
              ),
              MyText(
                text: "ID Number: ECLARIOS0006",
                fontFamily: AppFonts.InterRegular,
                lineHeight: 1,
                size: mqw * 0.020,
              ),
              SizedBox(
                height: mqh * 0.03,
              ),
              ProfileButton(
                text: 'Terms of Use',
                onTap: () {},
              ),
              SizedBox(
                height: mqh * 0.01,
              ),
              ProfileButton(
                text: 'Notifications Center',
                onTap: () {},
              ),
              SizedBox(
                height: mqh * 0.01,
              ),
              ProfileButton(
                text: 'Privacy Policy',
                onTap: () {},
              ),
              SizedBox(
                height: mqh * 0.01,
              ),
              ProfileButton(
                text: 'Help & FAQs',
                onTap: () {},
              ),
              SizedBox(
                height: mqh * 0.01,
              ),
              ProfileButton(
                text: 'Contact Us',
                onTap: () {},
              ),
              SizedBox(
                height: mqh * 0.01,
              ),
              ProfileButton(
                text: 'Sign Out',
                onTap: () {
                  userPreferences.removeuser().then((value) {
                    Get.offAll(LoginScreen());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
