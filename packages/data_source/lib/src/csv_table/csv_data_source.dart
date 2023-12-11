import 'package:csv/csv.dart';
import 'package:data_source/src/quote/quote_mapper.dart';
import 'package:entity/entity.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:repository/src/quote/quote_data_source.dart';

class CsvDataSource extends QuoteDataSource {
  CsvDataSource({
    required QuoteMapper quoteMapper,
  }) : _quoteMapper = quoteMapper;

  final QuoteMapper _quoteMapper;
  static const String _quotesCsvFilePath = "assets/quotes/quotes_data_base.txt";
  final CsvToListConverter _quotesConverter = const CsvToListConverter(fieldDelimiter: ";");
  Iterable<QuoteEntity>? quoteEntities;

  @override
  Future<Iterable<QuoteEntity>> getQuotes() async {
    try {
      final quotesRawData = await rootBundle.loadString(_quotesCsvFilePath);
      List<List<dynamic>> rawItems = _quotesConverter.convert(quotesRawData);
      return rawItems.map(
        (csvFields) => _quoteMapper.toEntityFromCsv(csvFields: csvFields),
      );
    } catch (_) {
      // TODO log error
      return [];
    }
  }
}
