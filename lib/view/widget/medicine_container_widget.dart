import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import 'common_image_view_widget.dart';
import 'my_text_widget.dart';

class MedicineContainer extends StatelessWidget {
  final String? imagePath;
  final String medicinename;
  final String? subname;
  final String description;
  final String price;
  final String? url;
  final Color? lowercontainercolor;
  final Color? uppercontainercolor;
  const MedicineContainer(
      {super.key,
      this.imagePath,
      required this.medicinename,
      required this.description,
      required this.price,
      this.subname,
      this.lowercontainercolor,
      this.uppercontainercolor,
      this.url});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: lowercontainercolor ?? kBottomBarColor),
                child: Container(
                  height: mqh * 0.1,
                  width: mqw * 0.43,
                  decoration: BoxDecoration(
                      color: uppercontainercolor ?? kContainerColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(mqw * 0.05))),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: uppercontainercolor ?? kContainerColor),
                child: Container(
                  height: mqh * 0.1,
                  width: mqw * 0.43,
                  decoration: BoxDecoration(
                      color: lowercontainercolor ?? kBottomBarColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(mqw * 0.05))),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: mqh * 0.005,
          left: mqw * 0.06,
          child: Center(
              child: Image(
            image: NetworkImage(url!),
            height: mqh * 0.09,
            width: mqw * 0.25,
          )
              // CommonImageView(
              //   url: url,
              //   imagePath: imagePath,
              //   height: mqh * 0.09,
              //   width: mqw * 0.25,
              // ),
              ),
        ),
        Positioned(
            top: mqh * -0.005,
            right: mqw * 0.02,
            child: Container(
              height: mqh * 0.06,
              width: mqw * 0.06,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kTextColor),
              child: Icon(
                Icons.add,
                size: mqw * 0.04,
                color: kPrimaryColor,
              ),
            )),
        Positioned(
            top: mqh * 0.1,
            child: Padding(
              padding: EdgeInsets.only(left: mqw * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MyText(
                        text: medicinename,
                        color: kTextColor1,
                        fontFamily: AppFonts.InterBold,
                        size: mqw * 0.035,
                      ),
                      SizedBox(
                        width: mqw * 0.01,
                      ),
                      MyText(
                        text: subname!,
                        color: kTextColor1,
                        fontFamily: AppFonts.InterRegular,
                        size: mqw * 0.035,
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: mqh * 0.01,
                  // ),
                  MyText(
                    text: description,
                    fontFamily: AppFonts.InterLight,
                    size: mqw * 0.02,
                    color: kBottomBarTextColor,
                  ),
                  SizedBox(
                    height: mqh * 0.01,
                  ),
                  Row(
                    children: [
                      MyText(
                        text: "MRP RS.",
                        fontFamily: AppFonts.InterBold,
                        size: mqw * 0.025,
                        color: kTextColor,
                      ),
                      MyText(
                        text: "${price}/-",
                        fontFamily: AppFonts.InterLight,
                        size: mqw * 0.025,
                        color: kTextColor1,
                      ),
                      SizedBox(
                        width: mqw * 0.02,
                      ),
                      Container(
                        height: mqh * 0.027,
                        width: mqw * 0.15,
                        decoration: BoxDecoration(
                            color: kTextColor1,
                            borderRadius: BorderRadius.circular(mqw * 0.03)),
                        child: Center(
                          child: MyText(
                            text: "Add to Cart",
                            textAlign: TextAlign.center,
                            fontFamily: AppFonts.InterMedium,
                            size: mqw * 0.019,
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
