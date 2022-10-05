import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entity/entity.dart';
import 'package:repository/src/quote/quote_fields.dart';

class QuoteMapper {
  const QuoteMapper();

  WeekdayQuoteEntity toEntity({
    required DocumentSnapshot quoteSnapshot,
  }) {
    return WeekdayQuoteEntity(
      id: quoteSnapshot.id,
      quote: quoteSnapshot.get(QuoteField.quote),
      author: quoteSnapshot.get(QuoteField.author),
      weekOfYear: quoteSnapshot.get(QuoteField.weekOfYear),
      dayOfWeek: quoteSnapshot.get(QuoteField.dayOfWeek),
    );
  }

  WeekdayQuoteEntity toEntityFromCsv({
    required List<dynamic> csvFields,
  }) {
    return WeekdayQuoteEntity(
      id: csvFields[QuoteField.quoteCsvIndex],
      quote: csvFields[QuoteField.quoteCsvIndex],
      author: csvFields[QuoteField.authorCsvIndex],
      dayOfWeek: csvFields[QuoteField.dayOfWeekCsvIndex],
      weekOfYear: csvFields[QuoteField.weekOfYearCsvIndex],
    );
  }
}
