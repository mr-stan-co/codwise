import 'package:entity/entity.dart';
import 'package:repository/src/quote/quote_fields.dart';

class QuoteMapper {
  const QuoteMapper();

  QuoteEntity toEntityFromCsv({
    required List<dynamic> csvFields,
  }) {
    return QuoteEntity(
      quote: csvFields[QuoteField.quoteCsvIndex],
      author: csvFields[QuoteField.authorCsvIndex],
    );
  }
}
