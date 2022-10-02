import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entity/entity.dart';
import 'package:repository/src/quote/quote_fields.dart';

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
