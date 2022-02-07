import 'package:elhanout/routes/routes.dart';
import 'package:elhanout/utils/theme.dart';
import 'package:elhanout/view/widgets/authtextformfield.dart';
import 'package:elhanout/view/widgets/buttonutils.dart';
import 'package:elhanout/view/widgets/checkbox.dart';
import 'package:elhanout/view/widgets/footercontainer.dart';
import 'package:elhanout/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/authcontroller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
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
                                  text: 'SIGN',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34,
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                TextUtils(
                                  text: 'UP',
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
                                  hint: 'User Name',
                                  controller: usernameController,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please insert your username!';
                                    }
                                  },
                                  type: TextInputType.name,
                                  prefix: Icon(
                                    Icons.person,
                                    color: Get.isDarkMode ? pinkClr : mainColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
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
                                  height: 15,
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
                                  text: ('I accept '),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color:
                                      Get.isDarkMode ? pinkClr : Colors.black),
                              GestureDetector(
                                child: TextUtils(
                                  text: ('terms & conditions'),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  underlined: true,
                                  color:
                                      Get.isDarkMode ? pinkClr : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ButtonUtils(
                              title: 'Sign Up',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if(controller.isChecked.isTrue){
                                    controller.signUpUsingEmail(
                                      email: emailController.text.trim(),
                                      password: passController.text,
                                      name: usernameController.text.trim(),
                                    );
                                  }
                                  else{
                                    Get.snackbar(
                                      'Notice',
                                      'Please Accept terms & conditions',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: darkGreyClr.withOpacity(0.8),
                                      colorText: Colors.white,
                                      borderColor: Get.isDarkMode ? pinkClr : mainColor,
                                      borderWidth: 1.0,
                                    );
                                  }
                                }
                              },
                              padHz: 120,
                              backColor: Get.isDarkMode ? pinkClr : mainColor,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FooterContainer(
                      text: 'Already have an account ?',
                      onPressed: () {
                        Get.offNamed(AppRoutes.loginScreen);
                      },
                      textType: 'Login'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
