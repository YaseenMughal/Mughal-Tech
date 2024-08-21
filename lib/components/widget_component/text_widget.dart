import 'package:flutter/material.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';

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

Widget richedText({text01, text02, void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: RichText(
        text: TextSpan(
            text: text01,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppin",
              color: AppColor.subtitleColor,
            ),
            children: [
              TextSpan(
                text: text02,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppin",
                  color: AppColor.titleColor,
                ),
              )
            ]),
      ),
    ),
  );
}

Widget doubleText({required String text, required void Function()? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColor.blackColor, fontFamily: "Poppin"),
      ),
      TextButton(
          onPressed: onTap,
          child: Text(
            "See all",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.mainColor, fontFamily: "Poppin"),
          ))
    ],
  );
}
