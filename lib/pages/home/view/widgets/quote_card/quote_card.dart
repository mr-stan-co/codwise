import 'dart:html';

import 'package:codwise/constants.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/background_card_attr.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/card_constants.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/copy_quote.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/dashed_separator.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/quote_text.dart';
import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    Key? key,
    required this.quoteEntity,
  }) : super(key: key);

  final QuoteEntity quoteEntity;

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
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _constructQuoteCard(quoteEntity),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _constructQuoteCard(QuoteEntity quoteEntity) {
    return [
      _siteName(),
      QuoteText(quoteText: quoteEntity.quote),
      _divider(),
      _quoteAuthor(quoteEntity.author),
      _copyText(quoteEntity.quote),
    ];
  }

  Widget _siteName() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Text(
        AppStrings.appName,
        style: TextStyle(
          color: AppColors.textGray,
          fontSize: 20,
          fontFamily: AppFonts.playfairDisplay,
        ),
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
    const sidePadding =  CardConstants.cardPadding;
    return Visibility(
      visible: authorName.isNotEmpty,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(sidePadding, 24, sidePadding, 0),
        child: Tooltip(
          message: 'Tap to google',
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
        ),
      ),
    );
  }

  Widget _copyText(String quoteText) {
    return CopyQuote(quoteText: quoteText);
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
    try {
      await launchUrl(url);
    } catch (_) {
      // TODO track issue in firebase
    }
  }
}
