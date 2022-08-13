import 'package:flutter/material.dart';
import 'package:wise_dev/constants.dart';

class AboutMainTitle extends StatelessWidget {
  const AboutMainTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "About",
      style: TextStyle(
          fontSize: 64, fontFamily: AppFonts.playfairDisplay, fontWeight: FontWeight.w600),
    );
  }
}
