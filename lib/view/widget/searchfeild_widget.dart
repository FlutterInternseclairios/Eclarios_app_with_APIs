import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../controller/checkbox_controller.dart';

class SearchFeildWidget extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchFeildWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;

    final CheckboxController checkboxController = Get.put(CheckboxController());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: mqw * 0.05),
      width: double.maxFinite,
      height: mqh * 0.055,
      decoration: BoxDecoration(
          color: kBottomBarColor,
          borderRadius: BorderRadius.circular(mqw * 0.05)),
      child: TextFormField(
        controller: checkboxController.searchController,
        onChanged: onChanged,
        cursorColor: kBlackColor2,
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: InkWell(
              onTap: () {
                checkboxController
                    .clearSearchField(checkboxController.searchController);
                onChanged?.call("");
              },
              child: Icon(
                Icons.cancel_rounded,
                color: Colors.grey,
              ),
            ),
            hintText: "Search Medicine",
            hintStyle: TextStyle(
                fontFamily: AppFonts.InterLight, color: kBottomBarTextColor)),
      ),
    );
  }
}
