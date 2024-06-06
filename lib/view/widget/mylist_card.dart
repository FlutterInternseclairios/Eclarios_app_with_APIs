import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import 'my_text_widget.dart';
import 'small_container_list.dart';

class MyListCard extends StatelessWidget {
  final String name;
  final String specialist;
  final String gender;
  final String backgroundImage;
  final Color color;

  const MyListCard(
      {super.key,
      required this.name,
      required this.specialist,
      required this.gender,
      required this.backgroundImage,
      required this.color});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Card(
      color: color,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mqw * 0.01, vertical: mqw * 0.015),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(backgroundImage),
                  radius: 50,
                ),
                SizedBox(width: mqw * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: name,
                        size: mqw * 0.035,
                        fontFamily: AppFonts.InterBold,
                      ),
                      MyText(
                        text: specialist,
                        size: mqw * 0.035,
                        fontFamily: AppFonts.InterRegular,
                      ),
                      MyText(
                        text: "Gender: $gender",
                        size: mqw * 0.035,
                        fontFamily: AppFonts.InterRegular,
                      ),
                      SmallContainerList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: mqw * 0.02,
            right: mqw * 0.02,
            child: Container(
              height: mqh * 0.05,
              width: mqw * 0.1,
              decoration: BoxDecoration(
                color: kTextColor,
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
          ),
        ],
      ),
    );
  }
}
