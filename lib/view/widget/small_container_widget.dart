import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import 'common_image_view_widget.dart';
import 'my_text_widget.dart';

class SmallContainer extends StatelessWidget {
  final String imagePath;
  final String medicinename;
  final String? subname;
  final String description;
  final String price;

  const SmallContainer({
    super.key,
    required this.imagePath,
    required this.medicinename,
    required this.description,
    required this.price,
    this.subname,
  });

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(mqw * 0.02),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: kLowerContainerColor),
                child: Container(
                  height: mqh * 0.038,
                  width: mqw * 0.16,
                  decoration: BoxDecoration(
                      color: kContainerColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(mqw * 0.03))),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: kContainerColor),
                child: Container(
                  height: mqh * 0.038,
                  width: mqw * 0.16,
                  decoration: BoxDecoration(
                      color: kLowerContainerColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(mqw * 0.03))),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: mqw * 0.01,
          child: Center(
            child: CommonImageView(
              imagePath: imagePath,
              height: mqw * 0.07,
              width: mqw * 0.09,
            ),
          ),
        ),
        Positioned(
            top: mqw * -0.005,
            right: mqw * 0.01,
            child: Container(
              height: mqh * 0.025,
              width: mqw * 0.025,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kTextColor),
              child: Icon(
                Icons.add,
                size: mqw * 0.01,
                color: kPrimaryColor,
              ),
            )),
        Positioned(
            top: mqw * 0.09,
            child: Padding(
              padding: EdgeInsets.only(left: mqw * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MyText(
                        text: medicinename,
                        color: kTextColor1,
                        fontFamily: AppFonts.InterBold,
                        size: mqw * 0.010,
                      ),
                      SizedBox(
                        width: mqw * 0.01,
                      ),
                      MyText(
                        text: subname!,
                        color: kTextColor1,
                        fontFamily: AppFonts.InterRegular,
                        size: mqw * 0.010,
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: mqh * 0.01,
                  // ),
                  MyText(
                    text: description,
                    fontFamily: AppFonts.InterLight,
                    lineHeight: 1,
                    size: mqw * 0.01,
                    color: kBottomBarTextColor,
                  ),
                  SizedBox(
                    height: mqh * 0.003,
                  ),
                  Row(
                    children: [
                      MyText(
                        text: "MRP RS.",
                        fontFamily: AppFonts.InterBold,
                        lineHeight: 1,
                        size: mqw * 0.007,
                        color: kTextColor,
                      ),
                      MyText(
                        text: price,
                        fontFamily: AppFonts.InterLight,
                        size: mqw * 0.007,
                        color: kTextColor1,
                      ),
                      SizedBox(
                        width: mqw * 0.02,
                      ),
                      Container(
                        height: mqh * 0.006,
                        width: mqw * 0.035,
                        decoration: BoxDecoration(
                            color: kTextColor1,
                            borderRadius: BorderRadius.circular(mqw * 0.02)),
                        child: Center(
                          child: MyText(
                            text: "Add to Cart",
                            textAlign: TextAlign.center,
                            fontFamily: AppFonts.InterMedium,
                            size: mqw * 0.007,
                            color: kPrimaryColor,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}
