import 'package:flutter/material.dart';
import 'package:practice_project/component/widget_components/button_widget.dart';
import 'package:practice_project/component/widget_components/textField_widget.dart';
import 'package:practice_project/component/widget_components/text_widget.dart';
import 'package:practice_project/component/constant/color_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController tfcemail = TextEditingController();
  TextEditingController tfcpassword = TextEditingController();

  bool toggle = false;

  void _togglePasswordVisibility() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: arrowButton(),
            ),
            const SizedBox(height: 20.0),
            authenticationText(title: "Hello Again!", subtitle: "Welcome Back You’ve Been Missed!"),
            const SizedBox(height: 30.0),
            appTextField(
              keyboardType: TextInputType.emailAddress,
              controller: tfcemail,
              labeltxt: "Email Address",
              prefixIcon: const Icon(Icons.mail_outline),
            ),
            appTextField(
              keyboardType: TextInputType.visiblePassword,
              obscureTxt: !toggle,
              controller: tfcpassword,
              labeltxt: "Password",
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                onPressed: _togglePasswordVisibility,
                icon: toggle ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined),
                color: toggle ? AppColor.titleColor : AppColor.subtitleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
