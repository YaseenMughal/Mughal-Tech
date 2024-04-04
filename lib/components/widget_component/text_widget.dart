import 'package:flutter/material.dart';
import 'package:practice_project/components/constant/color_constant.dart';

Widget authenticationText({title, subtitle}) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 28, color: AppColor.titleColor, fontFamily: "Poppin", fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 10.0),
      Text(
        subtitle,
        style: TextStyle(fontSize: 16, color: AppColor.subtitleColor, fontFamily: "Poppin", fontWeight: FontWeight.w400),
      )
    ],
  );
}
