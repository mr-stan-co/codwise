import 'package:codwise/pages/view_utils/screen_size_util.dart';
import 'package:flutter/material.dart';

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
        ),
      ),
    );
  }
}
