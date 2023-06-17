import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final String quote;
  final String author;

  const QuoteEntity({
    required this.quote,
    required this.author,
  });

  static const defaultQuote = QuoteEntity(
        quote: 'Some very wise quote',
        author: 'Some very smart author',
      );

  @override
  List<Object?> get props => [
        quote,
        author,
      ];
}
