import 'package:flutter/material.dart';

Widget buttonApp({
  double? height,
  double? width,
  String? text,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: const LinearGradient(
          colors: [
            Color(0xff5B9EE1),
            Color.fromARGB(255, 122, 184, 247),
          ],
        ),
      ),
      child: Center(
        child: Text(
          text!,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget arrowButton({BuildContext? context}) {
  return Container(
    height: 45,
    width: 45,
    decoration: const BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: IconButton(
          onPressed: () {
            Navigator.of(context!).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined)),
    ),
  );
}
