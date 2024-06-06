import 'package:eclarios/constants/app_colors.dart';
import 'package:eclarios/constants/app_fonts.dart';
import 'package:eclarios/models/mylist_model.dart';

import 'package:eclarios/view/widget/my_text_widget.dart';
import 'package:eclarios/view/widget/mylist_builder.dart';
import 'package:eclarios/view/widget/mylist_card.dart';
import 'package:eclarios/view/widget/small_container_list.dart';

import 'package:flutter/material.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mqw * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: "My List",
                size: mqw * 0.040,
                fontFamily: AppFonts.InterSemiBold,
                color: kBottomBarTextColor,
              ),
              SizedBox(
                height: mqw * 0.04,
              ),
              MylistBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
