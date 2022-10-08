import 'package:codwise/pages/home/view/widgets/quote_card/card_constants.dart';

enum BackgroundCardAttr {
  first(
    opacity: 0.7,
    width: CardConstants.cardWithMain - 200,
    bottomPadding: CardConstants.cardPadding,
    sidePadding: CardConstants.cardPadding * 2,
  ),
  second(
    opacity: 0.3,
    width: CardConstants.cardWithMain - 400,
    bottomPadding: 0,
    sidePadding: CardConstants.cardPadding * 3,
  );

  const BackgroundCardAttr({
    required this.opacity,
    required this.width,
    required this.bottomPadding,
    required this.sidePadding,
  });

  final double opacity;
  final double width;
  final double bottomPadding;
  final double sidePadding;
}
