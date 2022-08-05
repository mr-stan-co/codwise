import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entity/entity.dart';

class QuoteField {
  static const quote = 'quote';
  static const author = 'author';
  static const dayOfYear = 'day_of_year';
}

class QuoteMapper {
  const QuoteMapper();

  QuoteEntity toEntity({
    required DocumentSnapshot quoteSnapshot,
  }) {
    return QuoteEntity(
      id: quoteSnapshot.id,
      quote: quoteSnapshot.get(QuoteField.quote),
      author: quoteSnapshot.get(QuoteField.author),
      dayOfYear: quoteSnapshot.get(QuoteField.dayOfYear),
    );
  }
}
