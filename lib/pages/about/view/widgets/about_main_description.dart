import 'package:flutter/material.dart';
import 'package:wise_dev/constants.dart';
import 'package:wise_dev/pages/view_utils/screen_size_util.dart';

class AboutMainDescription extends StatelessWidget {
  const AboutMainDescription({
    Key? key,
    required this.aboutDescription,
  }) : super(key: key);

  final String aboutDescription;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        ScreenSizeUtil.getFromSize(MediaQuery.of(context).size) == ScreenSize.small;
    final double aboutTextSize = isSmallScreen ? 16 : 24;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        aboutDescription,
        style: TextStyle(
          fontSize: aboutTextSize,
          fontFamily: AppFonts.poppins,
        ),
      ),
    );
  }
}
