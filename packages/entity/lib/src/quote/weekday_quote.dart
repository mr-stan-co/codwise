import 'package:entity/src/quote/quote.dart';
import 'package:equatable/equatable.dart';

class WeekdayQuoteEntity extends Equatable implements QuoteEntity {
  final String id;
  final String quote;
  final String author;
  final int dayOfWeek;
  final int weekOfYear;

  const WeekdayQuoteEntity({
    required this.id,
    required this.quote,
    required this.author,
    required this.dayOfWeek,
    required this.weekOfYear,
  });

  @override
  List<Object?> get props =>
      [
        id,
        quote,
        author,
        dayOfWeek,
        weekOfYear,
      ];
}
