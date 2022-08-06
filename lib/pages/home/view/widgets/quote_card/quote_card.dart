import 'package:flutter/material.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _siteName(),
              _quoteText(),
              _separator(),
              _quoteAuthor(),
              _copyText(),
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

  Widget _quoteText() {
    return const Padding(
      padding: EdgeInsets.all(48.0),
      child: Text(
        "There are two ways to write error-free programmes; only the third works.",
        style: TextStyle(
          fontSize: 48,
          fontFamily: "PlayfairDisplay",
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _separator() {
    return const Opacity(
      opacity: 0.7,
      child: Padding(
        padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
        child: DashSeparator(),
      ),
    );
  }

  Widget _quoteAuthor() {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Text(
        "Alan Perlis",
        style: TextStyle(fontSize: 22),
      ),
    );
  }

  Widget _copyText() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: CopyText(),
    );
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
}
