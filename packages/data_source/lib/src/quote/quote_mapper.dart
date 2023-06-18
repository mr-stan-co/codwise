import 'package:data_source/src/quote/quote_fields.dart';
import 'package:entity/entity.dart';

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
