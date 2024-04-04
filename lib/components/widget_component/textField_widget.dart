import 'package:flutter/material.dart';
import 'package:practice_project/component/constant/color_constant.dart';

Widget appTextField({
  TextEditingController? controller,
  String? labeltxt,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool? obscureTxt,
  TextInputType? keyboardType,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureTxt ?? false,
      obscuringCharacter: '*',
      style: TextStyle(color: AppColor.blackColor, fontSize: 14.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(22.0),
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColor.whiteColor,
        labelText: labeltxt,
        labelStyle: TextStyle(color: AppColor.blackColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    ),
  );
}
