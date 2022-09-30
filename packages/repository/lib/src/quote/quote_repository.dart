import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entity/entity.dart';
import 'package:intl/intl.dart';
import 'package:repository/src/firebase_constants.dart';
import 'package:repository/src/quote/quote_mapper.dart';

class QuoteRepository {
  QuoteRepository({
    required QuoteMapper quoteMapper,
  }) : _quoteMapper = quoteMapper;

  final _quotesCollection = FirebaseFirestore.instance.collection(FirebasePath.quotes);
  final _today = DateTime.now();
  final QuoteMapper _quoteMapper;

  Future<QuoteEntity> getQuoteOfTheDay() async {
    final weekOfYear = _getWeekOfYear();
    final dayOfWeek = _getDayOfWeek();
    final todayQuoteQuery = await _quotesCollection
        .where(QuoteField.weekOfYear, isEqualTo: weekOfYear)
        .where(QuoteField.dayOfWeek, isEqualTo: dayOfWeek)
        .get();
    if (todayQuoteQuery.docs.isNotEmpty) {
      final quoteSnapshot = todayQuoteQuery.docs.first;
      final quote = _quoteMapper.toEntity(quoteSnapshot: quoteSnapshot);
      return Future.value(quote);
    } else {
      final anyQuoteQuery = await _quotesCollection.get();
      if (anyQuoteQuery.docs.isNotEmpty) {
        final quoteSnapshot = anyQuoteQuery.docs.first;
        final quote = _quoteMapper.toEntity(quoteSnapshot: quoteSnapshot);
        return Future.value(quote);
      } else {
        return Future.error("No quote for today :(");
      }
    }
  }

  int _getWeekOfYear() {
    final dayOfYear = int.parse(DateFormat('D').format(_today));
    // Formula from https://en.wikipedia.org/wiki/ISO_week_date#Calculation
    final weekOfYear = ((dayOfYear - _today.weekday + 10) / 7).floor();
    return weekOfYear;
  }

  int _getDayOfWeek() => _today.weekday;
}
