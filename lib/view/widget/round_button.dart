import 'package:eclarios/constants/app_colors.dart';
import 'package:eclarios/constants/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  final Color backgroundcolor;
  final bool loading;
  final double height, width;
  final double deviderheight;
  final double borderradius;
  final bool isdivider;
  final double? fontSize;
  final IconData? icon;
  final double? size;
  final double? deviderthickness;

  const RoundButton(
      {super.key,
      required this.onpressed,
      required this.text,
      this.backgroundcolor = Colors.purple,
      this.loading = false,
      this.height = 50,
      this.width = 150,
      this.borderradius = 30,
      this.isdivider = false,
      this.deviderheight = 20,
      this.fontSize,
      this.icon,
      this.size,
      this.deviderthickness});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderradius)),
          backgroundColor: backgroundcolor,
        ),
        child: loading
            ? CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
                backgroundColor: Colors.black,
                strokeCap: StrokeCap.round,
              )
            : Row(
                children: [
                  Expanded(
                    child: Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: fontSize,
                            fontFamily: AppFonts.InterBold,
                            color: kPrimaryColor)),
                  ),
                  isdivider
                      ? SizedBox(
                          height: deviderheight,
                          child: VerticalDivider(
                            color: kPrimaryColor,
                            thickness: deviderthickness,
                          ),
                        )
                      : SizedBox(),
                  Icon(
                    icon,
                    size: size,
                    color: kPrimaryColor,
                  )
                ],
              ),
      ),
    );
  }
}
