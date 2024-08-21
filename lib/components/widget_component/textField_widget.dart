import 'package:flutter/material.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';

Widget appTextField(
    {TextEditingController? controller,
    String? labeltxt,
    String? hinttxt,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? obscureTxt,
    TextInputType? keyboardType,
    FocusNode? focusNode,
    void Function(String)? onSubmitted}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureTxt ?? false,
      obscuringCharacter: '*',
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      style: TextStyle(color: AppColor.subtitleColor, fontSize: 14.0, fontFamily: "Poppin", fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12.0),
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColor.whiteColor,
        labelText: labeltxt,
        labelStyle: TextStyle(color: AppColor.blackColor, fontSize: 14.0, fontFamily: "Poppin", fontWeight: FontWeight.w500),
        hintText: hinttxt,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: AppColor.mainColor, width: 2.0)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: AppColor.mainColor, width: 1.0)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      ),
    ),
  );
}
