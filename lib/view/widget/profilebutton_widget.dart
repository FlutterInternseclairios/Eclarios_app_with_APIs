import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import 'my_text_widget.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const ProfileButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: mqw * 0.07, vertical: mqh * 0.025),
        height: mqh * 0.07,
        width: mqw * 1,
        decoration: BoxDecoration(
            color: kSearchContainerColor,
            borderRadius: BorderRadius.circular(mqw * 0.05)),
        child: MyText(
          text: text,
          size: mqw * 0.030,
          fontFamily: AppFonts.InterBold,
          color: kBottomBarTextColor,
        ),
      ),
    );
  }
}
