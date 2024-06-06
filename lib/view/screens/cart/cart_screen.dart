import 'package:eclarios/constants/app_fonts.dart';
import 'package:eclarios/view/widget/Image_controller_widget.dart';
import 'package:eclarios/view/widget/container_listview_widget.dart';
import 'package:eclarios/view/widget/grey_color_container_widget.dart';
import 'package:eclarios/view/widget/medicine_api_listview.dart';
import 'package:eclarios/view/widget/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/app_colors.dart';
import '../../../models/medicine_model.dart';
import '../../widget/common_image_view_widget.dart';
import '../../widget/medicine_container_widget.dart';
import '../../widget/my_text_widget.dart';

class CartScreen extends StatelessWidget {
  final String? name;
  final String? subname;
  final String? description;
  final String? extendeddescription;
  final String? price;
  final String? url;

  const CartScreen(
      {super.key,
      this.name,
      this.subname,
      this.description,
      this.extendeddescription,
      this.price,
      this.url});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;

    final PageController _pageController = PageController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(color: kBottomBarColor),
                  child: Container(
                    // height: mqh * 0.26,
                    // width: mqw * 1,
                    decoration: BoxDecoration(
                        color: kContainerColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(mqw * 0.2))),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  decoration: BoxDecoration(color: kContainerColor),
                  child: Container(
                    // height: mqh * 0.72,
                    // width: mqw * 1,
                    decoration: BoxDecoration(
                        color: kBottomBarColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(mqw * 0.2))),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: mqw * 0.045, bottom: mqw * 0.25),
            child: Column(
              children: [
                ImageController(
                  url: url,
                ),
                SizedBox(
                  height: mqw * 0.1,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: mqw * 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: mqw * 0.065, right: mqw * 0.065),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                MyText(
                                  text: name ?? "Laglin M",
                                  size: mqw * 0.045,
                                  fontFamily: AppFonts.InterBold,
                                  color: kTextColor1,
                                ),
                                Expanded(
                                    child: MyText(
                                  text: subname ?? " 5/500",
                                  color: kBottomBarTextColor,
                                  size: mqw * 0.045,
                                  fontFamily: AppFonts.InterRegular,
                                )),
                                Container(
                                  height: mqw * 0.05,
                                  width: mqw * 0.05,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: kTextColor1)),
                                  child: Icon(
                                    Icons.add,
                                    size: mqw * 0.04,
                                  ),
                                ),
                                SizedBox(
                                  width: mqw * 0.01,
                                ),
                                MyText(
                                  text: "1 Box",
                                  size: mqw * 0.045,
                                  fontFamily: AppFonts.InterRegular,
                                  color: kBottomBarTextColor,
                                ),
                                SizedBox(
                                  width: mqw * 0.01,
                                ),
                                Container(
                                  height: mqw * 0.05,
                                  width: mqw * 0.05,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: kTextColor1)),
                                  child: Icon(
                                    Icons.remove,
                                    size: mqw * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: mqw * 0.02,
                            ),
                            SizedBox(
                              width: mqw * 0.12,
                              child: Divider(
                                color: kBlackColor2,
                              ),
                            ),
                            SizedBox(
                              height: mqw * 0.01,
                            ),
                            MyText(
                              text: description ??
                                  "100 Tablets in 1 Box\n Lingliptin & Metformin Hydrochloride (ER) Tablets",
                              size: mqw * 0.030,
                              fontFamily: AppFonts.InterRegular,
                              color: kBottomBarTextColor,
                            ),
                            SizedBox(
                              height: mqw * 0.01,
                            ),
                            // MyText(
                            //   text:
                            //       "",
                            //   size: mqw * 0.030,
                            //   fontFamily: AppFonts.InterRegular,
                            //   color: kBottomBarTextColor,
                            // ),
                            SizedBox(
                              height: mqw * 0.01,
                            ),
                            MyText(
                              text: "MRP Rs.",
                              size: mqw * 0.040,
                              fontFamily: AppFonts.InterBold,
                              color: kTextColor,
                            ),
                            SizedBox(
                              height: mqw * 0.005,
                            ),
                            MyText(
                              text: price ?? "988.00/-",
                              size: mqw * 0.055,
                              lineHeight: 1,
                              fontFamily: AppFonts.InterLight,
                              color: kTextColor1,
                            ),
                            SizedBox(
                              height: mqw * 0.03,
                            ),
                            MyText(
                              text: "Product Description",
                              size: mqw * 0.030,
                              lineHeight: 1,
                              fontFamily: AppFonts.InterBold,
                            ),
                            SizedBox(
                              height: mqw * 0.02,
                            ),
                            MyText(
                              text:
                                  "The pharmaceutical industry is a subject of constant change and adaptability. When it comes to a country like Pakistan where there is record population along with an ever increasing demand, the numerous players of the Pakistani pharmaceutical industry have to keep up with the requirements.",
                              size: mqw * 0.032,
                              textAlign: TextAlign.justify,
                              lineHeight: 1,
                              fontFamily: AppFonts.InterRegular,
                            ),
                            SizedBox(
                              height: mqw * 0.02,
                            ),
                            MyText(
                              text:
                                  "Eclarios International from Islamabad is a shining example of a pharmaceutical manufacturer that started its business with API (Active Pharmaceutical Ingredient) supply and now has successfully spread its business with a number of sister concerns all across the country.",
                              size: mqw * 0.032,
                              textAlign: TextAlign.justify,
                              lineHeight: 1,
                              fontFamily: AppFonts.InterRegular,
                            ),
                            SizedBox(
                              height: mqw * 0.03,
                            ),
                            MyText(
                              text: "Related Products",
                              size: mqw * 0.030,
                              lineHeight: 1,
                              fontFamily: AppFonts.InterBold,
                            ),
                            SizedBox(
                              height: mqw * 0.02,
                            ),
                            MedicineApiListView(
                              lowercontainercolor: kLowerContainerColor,
                            ),
                            SizedBox(
                              height: mqw * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                  onpressed: () {},
                                  text: "Add To Cart",
                                  icon: Icons.arrow_forward,
                                  size: mqw * 0.04,
                                  fontSize: mqw * 0.030,
                                  height: mqw * 0.07,
                                  width: mqw * 0.4,
                                  backgroundcolor: kTextColor1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
