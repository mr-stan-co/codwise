import 'package:entity/entity.dart';

class HomeState {
  const HomeState(
    this.status,
    this.quotes,
    this.index,
  );

  final HomeStateStatus status;

  final Iterable<QuoteEntity> quotes;
  final int index;

  QuoteEntity get currentQuote => quotes.elementAt(index);

  static HomeState loading() => const HomeState(HomeStateStatus.loading, [], 0);

  HomeState next() {
    final int newIndex = index + 1 < quotes.length ? index + 1 : 0;
    return HomeState(status, quotes, newIndex);
  }

  HomeState previous() {
    final int newIndex = index - 1 >= 0 ? index - 1 : quotes.length - 1;
    return HomeState(status, quotes, newIndex);
  }

  static HomeState error() => const HomeState(HomeStateStatus.error, [], 0);
}

enum HomeStateStatus { loading, error, quote }
