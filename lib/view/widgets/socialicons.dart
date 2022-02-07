import 'dart:ui';

import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final Function onTap;
  final String asset;

  const SocialIcon({Key? key, required this.onTap, required this.asset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Image.asset(asset),
      ),
    );
  }
}
