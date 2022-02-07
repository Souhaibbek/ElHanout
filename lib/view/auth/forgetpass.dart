import 'dart:ui';

import 'package:elhanout/logic/controller/authcontroller.dart';
import 'package:elhanout/utils/theme.dart';
import 'package:elhanout/view/widgets/buttonutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/authtextformfield.dart';
import '../widgets/textutils.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Get.isDarkMode ? pinkClr : Colors.black,
          ),
          title: TextUtils(
            text: 'Forget Password',
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'If you want to recover your account, then please provide your email ID below.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Get.isDarkMode ? pinkClr : Colors.black,
                        ),
                      ),
                      Image.asset(
                        'assets/images/forgetpass copy.png',
                        scale: 0.8,

                      ),
                      AuthTextFormField(
                          controller: emailController,
                          validate: () {},
                          type: TextInputType.emailAddress,
                          prefix: Icon(
                            Icons.email,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                          hint: 'Email'),
                    ],
                  ),
                ),
                GetBuilder<AuthController>(builder: (controller) {
                  return ButtonUtils(
                    title: 'Send',
                    onPressed: () {
                      controller.resetPassword(email: emailController.text.trim());
                    },
                    padHz: 150,
                    backColor: Get.isDarkMode ? pinkClr : mainColor,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
