import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:elhanout/routes/routes.dart';
import 'package:elhanout/utils/theme.dart';
import 'package:elhanout/view/auth/login.dart';
import 'package:elhanout/view/auth/signup.dart';
import 'package:elhanout/view/widgets/buttonutils.dart';
import 'package:elhanout/view/widgets/textutils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(
                            child: TextUtils(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              text: 'Welcome',
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextUtils(
                                fontSize: 35,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                fontWeight: FontWeight.bold,
                                text: 'Hanouti',
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              const TextUtils(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                text: 'Shop',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonUtils(
                    backColor: Get.isDarkMode ? pinkClr : mainColor,
                    title: 'Get Started',
                    onPressed: () {
                      Get.offNamed(AppRoutes.loginScreen);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextUtils(
                        text: 'Don\'t have an account?',
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(AppRoutes.signUpScreen);
                        },
                        child: TextUtils(
                          text: 'SignUp',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
