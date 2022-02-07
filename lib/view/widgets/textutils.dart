import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final bool underlined;

  const TextUtils(
      {Key? key,
      required this.text, this.fontWeight=FontWeight.normal, this.fontSize=16,
      this.color = Colors.black,
      this.underlined = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          decoration: underlined ? TextDecoration.underline : null,
        ),
      ),
    );
  }
}
