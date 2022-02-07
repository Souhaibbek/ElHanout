import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:elhanout/utils/theme.dart';

class CheckBoxUtils extends StatelessWidget {
  final Function onChanged;
  final bool value;

  const CheckBoxUtils({
    Key? key,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: Checkbox(
        value: value,
        onChanged: (value) {
          onChanged(value);
        },
        checkColor: Get.isDarkMode ? pinkClr : mainColor,
        activeColor: Colors.grey.shade300,
      ),
    );
  }
}
