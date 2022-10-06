import 'dart:math';

import 'package:csv/csv.dart';
import 'package:entity/entity.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:repository/repository.dart';

class CsvDataSource {
  CsvDataSource({
    required QuoteMapper quoteMapper,
  }) : _quoteMapper = quoteMapper;

  QuoteMapper _quoteMapper;
  String _quotesCsvFilePath = "quotes/quotes_data_base.csv";
  CsvToListConverter _quotesConverter = const CsvToListConverter(fieldDelimiter: ";");

  Future<WeekdayQuoteEntity> getQuoteOfTheDay({
    required int weekOfYear,
    required int dayOfWeek,
  }) async {
    try {
      final quotesRawData = await rootBundle.loadString(_quotesCsvFilePath);
      List<List<dynamic>> rawItems = _quotesConverter.convert(quotesRawData);
      final Iterable<WeekdayQuoteEntity> quoteEntities = rawItems.map(
            (csvFields) => _quoteMapper.toEntityFromCsv(csvFields: csvFields),
      );
      if (quoteEntities.isEmpty) {
        return Future.error("No quote for today :(");
      } else {
        final quoteOfTheDay = quoteEntities.firstWhere(
                (quote) => quote.weekOfYear == weekOfYear && quote.dayOfWeek == dayOfWeek,
            orElse: () => _getRandomQuote(quoteEntities));
        return Future.value(quoteOfTheDay);
      }
    } catch (_) {
      return Future.error("No quote for today :(");
    }
  }

  WeekdayQuoteEntity _getRandomQuote(Iterable<WeekdayQuoteEntity> quoteEntities) {
    final randomIndex = Random().nextInt(quoteEntities.length);
    final randomQuote = quoteEntities.elementAt(randomIndex);
    return randomQuote;
  }
}
