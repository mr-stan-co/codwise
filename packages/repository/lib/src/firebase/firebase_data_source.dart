import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entity/entity.dart';
import 'package:repository/src/firebase/firebase_constants.dart';
import 'package:repository/src/quote/quote_data_source.dart';
import 'package:repository/src/quote/quote_fields.dart';
import 'package:repository/src/quote/quote_mapper.dart';

class FirebaseDataSource extends QuoteDataSource {
  FirebaseDataSource({
    required QuoteMapper quoteMapper,
  }) : _quoteMapper = quoteMapper;

  final _quotesCollection = FirebaseFirestore.instance.collection(FirebasePath.quotes);
  final QuoteMapper _quoteMapper;

  @override
  Future<WeekdayQuoteEntity> getQuoteByDay({
    required int weekOfYear,
    required int dayOfWeek,
  }) async {
    final todayQuoteQuery = await _quotesCollection
        .where(QuoteField.weekOfYear, isEqualTo: weekOfYear)
        .where(QuoteField.dayOfWeek, isEqualTo: dayOfWeek)
        .get();
    if (todayQuoteQuery.docs.isNotEmpty) {
      return _getQuoteOfTheDay(todayQuoteQuery);
    } else {
      final allQuotesQuery = await _quotesCollection.get();
      return _getRandomQuote(allQuotesQuery);
    }
  }

  Future<WeekdayQuoteEntity> _getQuoteOfTheDay(QuerySnapshot snapshot) {
    final quoteOfTheDaySnapshot = snapshot.docs.first;
    final quoteOfTheDay = _quoteMapper.toEntity(quoteSnapshot: quoteOfTheDaySnapshot);
    return Future.value(quoteOfTheDay);
  }

  Future<WeekdayQuoteEntity> _getRandomQuote(QuerySnapshot snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final randomIndex = Random().nextInt(snapshot.size);
      final randomQuoteSnapshot = snapshot.docs.elementAt(randomIndex);
      final randomQuote = _quoteMapper.toEntity(quoteSnapshot: randomQuoteSnapshot);
      return Future.value(randomQuote);
    } else {
      return Future.error("No quote for today :(");
    }
  }
}
