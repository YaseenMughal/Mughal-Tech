import 'package:flutter/material.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/constant_component/image_constant.dart';
import 'package:practice_project/components/widget_component/bottom_navigation_bar.dart';
import 'package:practice_project/components/widget_component/button_widegt.dart';
import 'package:practice_project/components/widget_component/textField_widget.dart';
import 'package:practice_project/components/widget_component/text_widget.dart';
import 'package:practice_project/components/widget_component/utils_widget.dart';
import 'package:practice_project/screens/forget_screen.dart';
import 'package:practice_project/screens/signup_screen.dart';

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
  void dispose() {
    super.dispose();
    tfcemail.dispose();
    tfcpassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ForgetScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Recovery Password",
                      style: TextStyle(fontSize: 13, color: AppColor.subtitleColor, fontFamily: "Poppin"),
                    ),
                  ),
                ),
                AppButton.mainButton(
                    text: "Sign In",
                    onTap: () {
                      if (tfcemail.text.isEmpty) {
                        Utils.appSnackBar(context, "Please enter a valid email!");
                      } else if (tfcpassword.text.isEmpty) {
                        Utils.appSnackBar(context, "Please enter a correct password!");
                      } else if (tfcpassword.text.length < 6) {
                        Utils.appSnackBar(context, "Password must be greater than 6 characters!");
                      } else {
                        Utils.appSnackBar(context, "Login SuccessFully!");
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const BottomNavBar()), ModalRoute.withName('/'));
                      }
                    }),
                const SizedBox(height: 10.0),
                AppButton.mainButton(
                  gradient: const LinearGradient(
                    colors: [Colors.white, Colors.white],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImage.googleLogo),
                      const SizedBox(width: 15),
                      Text(
                        "Sign in with google",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppin",
                          color: AppColor.titleColor,
                        ),
                      )
                    ],
                  ),
                ),
                richedText(
                  text01: "Don't have an account?",
                  text02: " Sign Up For Free",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
