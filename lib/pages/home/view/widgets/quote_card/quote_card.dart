import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wise_dev/constants.dart';
import 'package:wise_dev/pages/home/view/widgets/quote_card/background_card_attr.dart';
import 'package:wise_dev/pages/home/view/widgets/quote_card/card_constants.dart';
import 'package:wise_dev/pages/home/view/widgets/quote_card/copy_text.dart';
import 'package:wise_dev/pages/home/view/widgets/quote_card/dashed_separator.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backgroundCard(BackgroundCardAttr.second),
        _backgroundCard(BackgroundCardAttr.first),
        _mainCard(),
      ],
    );
  }

  Widget _backgroundCard(BackgroundCardAttr attr) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Opacity(
          opacity: attr.opacity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              attr.sidePadding,
              CardConstants.cardPadding,
              attr.sidePadding,
              attr.bottomPadding,
            ),
            child: Container(
              width: attr.width,
              height: CardConstants.cardPadding,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(CardConstants.cardBorderRadius),
                  bottomRight: Radius.circular(CardConstants.cardBorderRadius),
                ),
                boxShadow: _cardShadow(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _mainCard() {
    const quoteText = "There are two ways to write error-free programmes; only the third works.";
    const authorName = "Alan Perlis";
    return Align(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          CardConstants.cardPadding,
          CardConstants.cardPadding,
          CardConstants.cardPadding,
          CardConstants.cardPadding * 2,
        ),
        child: Container(
          width: CardConstants.cardWithMain,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(CardConstants.cardBorderRadius)),
            boxShadow: _cardShadow(),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(48.0),
                    child: SizedBox(
                      height: 200,
                      child: SvgPicture.asset('assets/images/quote_icon.svg'),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _siteName(),
                  _quoteText(quoteText),
                  _divider(),
                  _quoteAuthor(authorName),
                  _copyText(quoteText),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _siteName() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Text(
        "Adwisely",
        style: TextStyle(
          color: AppColors.textGray,
          fontSize: 20,
          fontFamily: "PlayfairDisplay",
        ),
      ),
    );
  }

  Widget _quoteText(String quoteText) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Text(
        quoteText,
        style: const TextStyle(
          fontSize: 48,
          fontFamily: AppFonts.playfairDisplay,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _divider() {
    return const Opacity(
      opacity: 0.7,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: CardConstants.cardPadding * 3,
        ),
        child: DashSeparator(),
      ),
    );
  }

  Widget _quoteAuthor(String authorName) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(CardConstants.cardPadding, 24, CardConstants.cardPadding, 0,),
      child: InkWell(
        onTap: () => onAuthorNameClicked(authorName),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            authorName,
            style: const TextStyle(
              fontSize: 22,
              fontFamily: AppFonts.poppins,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }

  Widget _copyText(String quoteText) {
    return CopyText(quoteText: quoteText);
  }

  List<BoxShadow> _cardShadow() {
    return [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 2,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ];
  }

  onAuthorNameClicked(String searchQuery) async {
    final Uri url = Uri.parse('https://www.google.com/search?q=$searchQuery');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
