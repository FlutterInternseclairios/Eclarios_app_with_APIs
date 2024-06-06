import 'package:eclarios/constants/app_colors.dart';
import 'package:eclarios/constants/app_fonts.dart';
import 'package:eclarios/models/home_medicine_model.dart';
import 'package:eclarios/models/medicine_model.dart';
import 'package:eclarios/models/segments_api_model.dart';
import 'package:eclarios/models/segments_model.dart';
import 'package:eclarios/services/states_services.dart';
import 'package:eclarios/view/screens/auth/login/login.dart';
import 'package:eclarios/view/screens/newlylaunched/newly_launched.dart';
import 'package:eclarios/view/widget/common_image_view_widget.dart';
import 'package:eclarios/view/widget/container_listview_widget.dart';
import 'package:eclarios/view/widget/medicine_api_listview.dart';
import 'package:eclarios/view/widget/medicine_container_widget.dart';
import 'package:eclarios/view/widget/my_text_widget.dart';
import 'package:eclarios/view/widget/round_button.dart';
import 'package:eclarios/view/widget/segments_api_gridview.dart';
import 'package:eclarios/view/widget/segments_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../user_preference/user_preference.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    List<String> images = [
      "assets/images/download1.jfif",
      "assets/images/download2.jfif"
    ];
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: mqh * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CommonImageView(
                    imagePath: "assets/images/doctorstack.png",
                    width: mqw * 1,
                    height: mqh * 0.32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mqw * 0.05, top: mqh * 0.05),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            MyText(
                              text: "Welcome to ",
                              size: mqw * 0.025,
                              fontFamily: AppFonts.InterRegular,
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: kPrimaryColor,
                            ),
                            MyText(
                              text: "Eclarios international Pvt.Ltd.",
                              size: mqw * 0.025,
                              fontFamily: AppFonts.InterRegular,
                              color: kPrimaryColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mqh * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Leading\nThe Way In\nMedical\nExcellence",
                              lineHeight: 1,
                              size: mqw * 0.045,
                              fontFamily: AppFonts.InterBold,
                              color: kPrimaryColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mqh * 0.01,
                        ),
                        Row(
                          children: [
                            MyText(
                              text: "Your Health Intellingence,\nOur Focus",
                              lineHeight: 1,
                              size: mqw * 0.025,
                              fontFamily: AppFonts.InterRegular,
                              color: kPrimaryColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mqh * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RoundButton(
                              onpressed: () {},
                              text: "Learn More",
                              fontSize: mqw * 0.02,
                              isdivider: true,
                              deviderheight: mqh * 0.022,
                              deviderthickness: mqw * 0.003,
                              backgroundcolor: kTextColor,
                              height: mqh * 0.035,
                              width: mqw * 0.35,
                              icon: Icons.add,
                              size: mqw * 0.045,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: mqh * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: mqw * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: "Newly Launched",
                          size: mqw * 0.035,
                          fontFamily: AppFonts.InterMedium,
                          color: kBottomBarTextColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: mqw * 0.05),
                          child: RoundButton(
                            onpressed: () {
                              Get.to(NewlyLunched(),
                                  transition: Transition.leftToRightWithFade,
                                  duration: Duration(milliseconds: 500));
                            },
                            text: "See All",
                            fontSize: mqw * 0.025,
                            backgroundcolor: kTextColor1,
                            width: mqw * 0.28,
                            height: mqh * 0.04,
                            icon: Icons.arrow_forward_ios,
                            size: mqw * 0.04,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: mqh * 0.01,
                    ),
                    MyText(
                      text: "Recently Added To Basket",
                      size: mqw * 0.017,
                      fontFamily: AppFonts.InterLight,
                      color: kBottomBarTextColor,
                    ),
                    SizedBox(
                      height: mqh * 0.01,
                    ),
                    MedicineApiListView(),
                    //ContainerListView(),
                    SizedBox(
                      height: mqh * 0.01,
                    ),
                    SizedBox(
                      height: mqh * 0.2,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: mqw * 0.02),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(mqw * 0.03),
                                    child: CommonImageView(
                                      imagePath: images[index],
                                      height: mqh * 0.18,
                                      width: mqw * 0.6,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: mqh * 0.01,
                    ),
                    MyText(
                      text: "Best Selling Product",
                      size: mqw * 0.035,
                      fontFamily: AppFonts.InterMedium,
                      color: kBottomBarTextColor,
                    ),
                    SizedBox(
                      height: mqh * 0.01,
                    ),
                    MyText(
                      text: "Best Selling Product Added in Basket",
                      size: mqw * 0.017,
                      fontFamily: AppFonts.InterLight,
                      color: kBottomBarTextColor,
                    ),
                    SizedBox(
                      height: mqh * 0.01,
                    ),
                    MedicineApiListView(),
                    //ContainerListView(),
                    SizedBox(
                      height: mqh * 0.02,
                    ),
                    MyText(
                      text: "Our Segments",
                      size: mqw * 0.035,
                      fontFamily: AppFonts.InterMedium,
                      color: kBottomBarTextColor,
                    ),
                    SizedBox(
                      height: mqh * 0.01,
                    ),
                    MyText(
                      text: "Best Selling Product Added in Basket",
                      size: mqw * 0.017,
                      fontFamily: AppFonts.InterLight,
                      color: kBottomBarTextColor,
                    ),
                    SegmentsApiGridView(),
                    //SegmentsView()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
