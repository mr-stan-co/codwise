import 'package:flutter/material.dart';
import 'package:codwise/constants.dart';
import 'package:codwise/pages/view_utils/screen_size_util.dart';

class AboutMainTitle extends StatelessWidget {
  const AboutMainTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        ScreenSizeUtil.getFromSize(MediaQuery.of(context).size) == ScreenSize.small;
    final double aboutTextSize = isSmallScreen ? 32 : 64;
    return Text(
      "About",
      style: TextStyle(
        fontSize: aboutTextSize,
        fontFamily: AppFonts.playfairDisplay,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
