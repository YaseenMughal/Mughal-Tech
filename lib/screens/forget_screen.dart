import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_project/components/constant_component/color_constant.dart';
import 'package:practice_project/components/widget_component/bottom_navigation_bar.dart';
import 'package:practice_project/components/widget_component/button_widegt.dart';
import 'package:practice_project/components/widget_component/textField_widget.dart';
import 'package:practice_project/components/widget_component/text_widget.dart';
import 'package:practice_project/components/widget_component/utils_widget.dart';
import 'package:practice_project/screens/home_screen.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => ForgetScreenState();
}

class ForgetScreenState extends State<ForgetScreen> {
  TextEditingController tfcemail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                authenticationText(title: "Recovery Password", subtitle: "Plaese Enter Your Email Address To\n Recieve a Verification Code."),
                const SizedBox(height: 30.0),
                appTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: tfcemail,
                  labeltxt: "Email Address",
                  prefixIcon: const Icon(Icons.mail_outline),
                ),
                const SizedBox(height: 20),
                AppButton.mainButton(
                    text: "Continue",
                    onTap: () {
                      if (tfcemail.text.isEmpty) {
                        Utils.appSnackBar(context, "Please enter a valid email!");
                      } else {
                        Utils.appSnackBar(context, "Password Recovered SuccessFully!");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
