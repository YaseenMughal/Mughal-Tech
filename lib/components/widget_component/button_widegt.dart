import 'package:flutter/material.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';

class AppButton {
  static Widget arrowButtom({required BuildContext context}) {
    return Container(
      height: 35,
      width: 35,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }

  static Widget mainButton({
    double? height,
    double? width,
    String? text,
    Color? btnTextColor,
    void Function()? onTap,
    Widget? child,
    Gradient? gradient,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          height: height ?? 50,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: gradient ??
                const LinearGradient(
                  colors: [
                    Color(0xff5B9EE1),
                    Color.fromARGB(255, 122, 184, 247),
                  ],
                ),
          ),
          child: child ??
              Center(
                child: Text(
                  text!,
                  style: TextStyle(fontSize: 18, color: btnTextColor ?? AppColor.whiteColor, fontFamily: "Poppin"),
                ),
              ),
        ),
      ),
    );
  }
}
