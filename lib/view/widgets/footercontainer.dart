import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:elhanout/utils/theme.dart';
import 'package:elhanout/view/widgets/textutils.dart';

class FooterContainer extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;

  const FooterContainer({
    required this.text,
    required this.onPressed,
    required this.textType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtils(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: text,
                color:  Colors.white,
              ),
              TextButton(
                onPressed: onPressed,
                child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: textType,
                  color: Colors.white,
                  underlined: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
