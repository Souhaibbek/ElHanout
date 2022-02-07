import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elhanout/main.dart';
import 'package:elhanout/utils/theme.dart';
import 'package:elhanout/view/widgets/textutils.dart';

class ButtonUtils extends StatelessWidget {
  final String title;
  final Color backColor;
  final Color textColor;
  final double textSize;
  final Function onPressed;
  final double padHz;
  final double padVc;

  const ButtonUtils({
    Key? key,
    required this.title,
    this.backColor = mainColor,
    this.textColor = Colors.white,
    this.textSize = 18,
    required this.onPressed, this.padHz=40 , this.padVc=10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: textSize,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: backColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding:  EdgeInsets.symmetric(
          horizontal: padHz,
          vertical: padVc,
        ),
      ),
    );
  }
}
