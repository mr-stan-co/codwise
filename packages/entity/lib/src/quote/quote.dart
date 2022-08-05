import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final String id;
  final String quote;
  final String author;
  final int dayOfYear;

  const QuoteEntity({
    required this.id,
    required this.quote,
    required this.author,
    required this.dayOfYear,
  });

  @override
  List<Object?> get props => [
        id,
        quote,
        author,
        dayOfYear,
      ];
}
