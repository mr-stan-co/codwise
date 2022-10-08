import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:codwise/constants.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/background_card_attr.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/card_constants.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/copy_quote.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/dashed_separator.dart';
import 'package:codwise/pages/view_utils/screen_size_util.dart';

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
    final double quoteTextSize = isSmallScreen ? 16 : 48;
    return Padding(
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
    );
  }
}
