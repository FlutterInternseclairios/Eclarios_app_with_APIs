import 'package:eclarios/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/segments_model.dart';
import 'common_image_view_widget.dart';

class SegmentsView extends StatelessWidget {
  const SegmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: mqw * 0.03),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: 14 / 16,
        ),
        itemCount: segments.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),

        // scrollDirection: Axis,
        itemBuilder: (context, index) {
          final image = segments[index].image;
          final name = segments[index].name;
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(mqw * 0.035),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CommonImageView(
                  imagePath: image,
                  height: mqh * 0.1,
                ),
                Positioned(
                  bottom: 0,
                  // left: mqw * 0.02,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: mqh * 0.007,
                    ),
                    child: Container(
                      height: mqh * 0.04,
                      width: mqw * 0.25,
                      decoration: BoxDecoration(
                        color: kBottomBarColor,
                        borderRadius: BorderRadius.circular(mqw * 0.04),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: mqw * 0.03),
                              child: Text(
                                  textAlign: TextAlign.center,
                                  name,
                                  style: TextStyle(
                                      fontSize: mqw * 0.022,
                                      color: kBottomBarTextColor)),
                            ),
                          ),
                          Container(
                            height: mqh * 0.08,
                            width: mqw * 0.08,
                            decoration: BoxDecoration(
                              color: kTextColor1,
                              borderRadius: BorderRadius.circular(mqw * 0.05),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_outward,
                                color: kPrimaryColor,
                                size: mqw * 0.045,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
