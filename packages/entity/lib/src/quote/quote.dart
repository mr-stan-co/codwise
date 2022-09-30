import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final String id;
  final String quote;
  final String author;
  final int dayOfWeek;
  final int weekOfYear;

  const QuoteEntity({
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
