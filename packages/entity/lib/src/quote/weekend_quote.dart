import 'package:entity/src/quote/quote.dart';
import 'package:equatable/equatable.dart';

class WeekendQuoteEntity extends Equatable implements QuoteEntity {
  final String quote;

  const WeekendQuoteEntity({
    required this.quote,
  });

  @override
  List<Object?> get props =>
      [
        quote,
      ];
}
