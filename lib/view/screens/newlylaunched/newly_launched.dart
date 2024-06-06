import 'package:eclarios/models/medicine_model.dart';
import 'package:eclarios/services/states_services.dart';
import 'package:eclarios/view/widget/medicine_container_widget.dart';
import 'package:eclarios/view/widget/newlylaunched_api_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eclarios/constants/app_colors.dart';
import 'package:eclarios/constants/app_fonts.dart';
import 'package:eclarios/view/widget/common_image_view_widget.dart';
import 'package:eclarios/view/widget/my_text_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../models/home_medicine_model.dart';

class NewlyLunched extends StatelessWidget {
  const NewlyLunched({super.key});

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: mqh * 0.2,
                  width: mqw * 1,
                  decoration: BoxDecoration(
                    color: kContainer2Color,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(mqw * 0.15),
                      bottomRight: Radius.circular(mqw * 0.15),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: mqw * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: mqw * 0.1,
                        child: Divider(
                          thickness: mqh * 0.002,
                        ),
                      ),
                      MyText(
                        text: "Our Products",
                        fontFamily: AppFonts.InterBold,
                        lineHeight: 0.5,
                        size: mqw * 0.060,
                        color: kPrimaryColor,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: MyText(
                              text: "Gallery",
                              fontFamily: AppFonts.InterRegular,
                              lineHeight: 1.5,
                              fontStyle: FontStyle.italic,
                              size: mqw * 0.060,
                              color: kPrimaryColor,
                            ),
                          ),
                          SizedBox(width: mqw * 0.02),
                          CommonImageView(
                            imagePath: "assets/images/doublemedicine.png",
                            height: mqh * 0.12,
                            width: mqw * 0.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: mqw * 0.45,
                  right: mqw * 0.45,
                  child: Container(
                    height: mqh * 0.01,
                    width: mqw * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(mqw * 0.25),
                        bottomRight: Radius.circular(mqw * 0.25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.6),
                          spreadRadius: 30,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: mqw * 0.06,
                    left: mqw * 0.06,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: mqw * 0.04,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: mqh * 0.03, left: mqw * 0.05, right: mqw * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Newly Launched",
                    lineHeight: 0.5,
                  ),
                  NewlyLaunchedApiList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
