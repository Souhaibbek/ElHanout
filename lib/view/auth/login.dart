import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elhanout/routes/routes.dart';
import 'package:elhanout/utils/theme.dart';
import 'package:elhanout/view/widgets/authtextformfield.dart';
import 'package:elhanout/view/widgets/buttonutils.dart';
import 'package:elhanout/view/widgets/checkbox.dart';
import 'package:elhanout/view/widgets/footercontainer.dart';
import 'package:elhanout/view/widgets/textutils.dart';
import '../../logic/controller/authcontroller.dart';
import '../widgets/socialicons.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: [
                                TextUtils(
                                  text: 'LOG',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34,
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                TextUtils(
                                  text: 'IN',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ],
                            ),
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                AuthTextFormField(
                                  hint: 'Email',
                                  controller: emailController,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please insert your email!';
                                    }
                                  },
                                  type: TextInputType.emailAddress,
                                  prefix: Icon(
                                    Icons.email,
                                    color: Get.isDarkMode ? pinkClr : mainColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AuthTextFormField(
                                  isPass: controller.passShow.value,
                                  hint: 'Password',
                                  controller: passController,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please insert your password!';
                                    }
                                  },
                                  type: TextInputType.visiblePassword,
                                  prefix: Icon(
                                    Icons.lock,
                                    color: Get.isDarkMode ? pinkClr : mainColor,
                                  ),
                                  suffix: controller.suffixIcon.value,
                                  suffixPressed: () {
                                    controller.visibility();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              CheckBoxUtils(
                                  value: controller.isChecked.value,
                                  onChanged: (value) {
                                    controller.changeCheckBox();
                                  }),
                              TextUtils(
                                text: ('Remember me'),
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Get.isDarkMode ? pinkClr : Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.forgetScreen);
                                },
                                child: TextUtils(
                                  text: 'Forget Password?',
                                  color:
                                      Get.isDarkMode ? pinkClr : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          ButtonUtils(
                            title: 'Login',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controller.loginUsingEmail(
                                    email: emailController.text.trim(),
                                    password: passController.text);
                              }
                            },
                            padHz: 120,
                            backColor: Get.isDarkMode ? pinkClr : mainColor,
                            textColor: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: TextUtils(
                              text: '-OR-',
                              color: Get.isDarkMode ? pinkClr : Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialIcon(
                                  onTap: () {
                                    // need to fix fb signIn
                                    // controller.faceBookSignIn();
                                  },
                                  asset: 'assets/images/facebook.png'),
                              SocialIcon(
                                  onTap: () {
                                    controller.googleSignIn();
                                  },
                                  asset: 'assets/images/google.png'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  FooterContainer(
                      text: 'Don\'t have an account ?',
                      onPressed: () {
                        Get.offNamed(AppRoutes.signUpScreen);
                      },
                      textType: 'Sign up'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
