import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entity/entity.dart';

class QuoteField {
  static const quote = 'quote';
  static const author = 'author';
  static const weekOfYear = 'week_of_year';
  static const dayOfWeek = 'day_of_week';
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
      weekOfYear: quoteSnapshot.get(QuoteField.weekOfYear),
      dayOfWeek: quoteSnapshot.get(QuoteField.dayOfWeek),
    );
  }
}
