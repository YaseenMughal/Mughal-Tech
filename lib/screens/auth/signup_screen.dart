import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/constant_component/image_constant.dart';
import 'package:practice_project/components/widget_component/button_widegt.dart';
import 'package:practice_project/components/widget_component/textField_widget.dart';
import 'package:practice_project/components/widget_component/text_widget.dart';
import 'package:practice_project/components/widget_component/utils_widget.dart';
import 'package:practice_project/screens/auth/forget_screen.dart';
import 'package:practice_project/screens/home_screen.dart';
import 'package:practice_project/screens/auth/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController tfcname = TextEditingController();
  TextEditingController tfcemail = TextEditingController();
  TextEditingController tfcpassword = TextEditingController();

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool toggle = false;

  void _togglePasswordVisibility() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  void dispose() {
    super.dispose();
    tfcname.dispose();
    tfcemail.dispose();
    tfcpassword.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: AppButton.arrowButtom(context: context),
                ),
                const SizedBox(height: 20.0),
                authenticationText(title: "Create Account", subtitle: "Let's Create Account Together!"),
                const SizedBox(height: 30.0),
                appTextField(
                  keyboardType: TextInputType.name,
                  controller: tfcname,
                  labeltxt: "Your Name",
                  prefixIcon: const Icon(Icons.person),
                  focusNode: nameFocusNode,
                  onSubmitted: (p0) {
                    Utils.fieldFocus(context, nameFocusNode, emailFocusNode);
                  },
                ),
                appTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: tfcemail,
                  labeltxt: "Email Address",
                  prefixIcon: const Icon(Icons.mail_outline),
                  focusNode: emailFocusNode,
                  onSubmitted: (p0) {
                    Utils.fieldFocus(context, emailFocusNode, passwordFocusNode);
                  },
                ),
                appTextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureTxt: !toggle,
                  controller: tfcpassword,
                  labeltxt: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  focusNode: passwordFocusNode,
                  suffixIcon: IconButton(
                    onPressed: _togglePasswordVisibility,
                    icon: toggle ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined),
                    color: toggle ? AppColor.titleColor : AppColor.subtitleColor,
                  ),
                ),
                const SizedBox(height: 20),
                AppButton.mainButton(
                    text: "Sign Up",
                    onTap: () {
                      if (tfcname.text.isEmpty) {
                        Utils.appSnackBar(context, "Please enter full name!");
                      } else if (tfcemail.text.isEmpty) {
                        Utils.appSnackBar(context, "Please enter valid email!");
                      } else if (tfcpassword.text.isEmpty) {
                        Utils.appSnackBar(context, "Please enter valid password!");
                      } else if (tfcpassword.text.length < 6) {
                        Utils.appSnackBar(context, "Password must be greater than 6 characters!");
                      } else {
                        Utils.appSnackBar(context, "SignUp SuccessFully!");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }
                    }),
                const SizedBox(height: 10),
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
                  text01: "Already have an account?",
                  text02: " Sign In",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
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
