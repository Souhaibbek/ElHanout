import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:elhanout/utils/theme.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function validate;
  final Function? suffixPressed;
  final TextInputType type;
  final bool isPass;
  final Widget prefix;
  final IconData? suffix;
  final String hint;

  const AuthTextFormField({
    Key? key,
    required this.controller,
    required this.validate,
    required this.type,
    this.isPass = false,
    required this.prefix,
    this.suffix,
    required this.hint,
    this.suffixPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
      controller: controller,
      validator: (value) {
        return validate(value);
      },
      keyboardType: type,
      obscureText: isPass,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: hint,
        fillColor: Get.isDarkMode ? darkGreyClr : Colors.grey.shade200,
        filled: true,
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? InkWell(
                child: Icon(
                  suffix,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                onTap: () {
                  suffixPressed!();
                },
              )
            : null,
      ),
    );
  }
}
