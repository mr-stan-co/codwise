import 'package:codwise/constants.dart';
import 'package:codwise/pages/view_utils/screen_size_util.dart';
import 'package:flutter/material.dart';

class QuoteText extends StatelessWidget {
  const QuoteText({
    Key? key,
    required this.quoteText,
  }) : super(key: key);

  final String quoteText;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        ScreenSizeUtil.getFromSize(MediaQuery.of(context).size) == ScreenSize.small;
    final double quoteTextSize = isSmallScreen ? 24 : 48;
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Text(
          quoteText,
          style: TextStyle(
            fontSize: quoteTextSize,
            fontFamily: AppFonts.playfairDisplay,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
