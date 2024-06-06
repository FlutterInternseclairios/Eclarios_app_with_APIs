import 'dart:ffi';

import 'package:eclarios/view/controller/checkbox_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import 'my_text_widget.dart';

class SearchContainer extends StatelessWidget {
  final String name;
  final String? subname;
  final String description;
  final String stars;
  final String rating;
  final String price;
  final String url;
  final CheckboxController controller;

  const SearchContainer(
      {super.key,
      required this.name,
      this.subname,
      required this.description,
      required this.stars,
      required this.rating,
      required this.price,
      required this.url,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    // final CheckboxController checkboxController = Get.put(CheckboxController());
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: mqh * 0.01),
      child: Card(
        color: kSearchContainerColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mqw * 0.05, vertical: mqh * 0.015),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MyText(
                          text: name,
                          color: kTextColor1,
                          fontFamily: AppFonts.InterBold,
                          size: mqw * 0.040,
                        ),
                        SizedBox(
                          width: mqw * 0.01,
                        ),
                        MyText(
                          text: subname ?? "",
                          size: mqw * 0.040,
                          fontFamily: AppFonts.InterRegular,
                        ),
                      ],
                    ),
                    MyText(
                      text: description,
                      size: mqw * 0.025,
                    ),
                    // MyText(
                    //   text: description,
                    //   size: mqw * 0.025,
                    // ),
                    Row(
                      children: [
                        Container(
                          width: mqw * 0.22,
                          height: mqh * 0.02,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(mqw * 0.05),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(-1, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: mqw * .01,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                  int.tryParse(stars) ?? 4,
                                  (index) => Icon(
                                        Icons.star,
                                        color: Colors.yellow[600],
                                        size: mqw * 0.04,
                                      )),
                            ),
                          ),
                        ),
                        SizedBox(width: mqw * 0.01),
                        MyText(
                          text: "$rating Ratings",
                          size: mqw * 0.018,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mqh * 0.005,
                    ),
                    Row(
                      children: [
                        MyText(
                          text: "MRP RS.",
                          size: mqw * 0.030,
                          color: kTextColor,
                          fontFamily: AppFonts.InterBold,
                        ),
                        SizedBox(
                          width: mqw * 0.01,
                        ),
                        MyText(
                          text: "$price/-",
                          size: mqw * 0.030,
                          fontFamily: AppFonts.InterRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mqw * 0.02,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: mqh * 0.10,
                    width: mqw * 0.30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(mqw * 0.02),
                      image: DecorationImage(
                        image: NetworkImage(
                          url,
                        ),

                        // AssetImage(
                        //     "assets/images/Rectangle-removebg-preview.png"),
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -mqh * 0.013, // Move it half outside
                    left: mqw * 0.07,
                    right: mqw * 0.07,
                    child: Container(
                      height: mqh * 0.03,
                      // width: mqw * 0.3,
                      decoration: BoxDecoration(
                          color: kTextColor,
                          borderRadius: BorderRadius.circular(mqw * 0.02)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: mqw * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.increaseValue();
                              },
                              child: Icon(
                                Icons.add,
                                color: kPrimaryColor,
                                size: mqw * 0.04,
                              ),
                            ),
                            Obx(() => MyText(
                                  text: controller.value.toString(),
                                  color: kPrimaryColor,
                                )),
                            InkWell(
                              onTap: () {
                                if (controller.value.value > 0) {
                                  controller.decreaseValue();
                                }
                              },
                              child: Icon(
                                Icons.remove,
                                color: kPrimaryColor,
                                size: mqw * 0.04,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
