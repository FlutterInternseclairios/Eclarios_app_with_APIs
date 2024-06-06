import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../constants/app_colors.dart';

class MyTextfeild extends StatelessWidget {
  final IconData icon;
  final TextEditingController? controller;
  final bool obsecuretext;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final String? hintText;

  const MyTextfeild({
    super.key,
    required this.icon,
    this.controller,
    this.obsecuretext = false,
    this.suffixIcon,
    this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecuretext,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: kTextColor1,
        ),
        suffixIcon: suffixIcon,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kTextColor1),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kTextColor1),
        ),
      ),
    );
  }
}
