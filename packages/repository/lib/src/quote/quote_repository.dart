import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entity/entity.dart';
import 'package:repository/src/firebase_constants.dart';
import 'package:repository/src/quote/quote_mapper.dart';

class QuoteRepository {
  QuoteRepository({
    required QuoteMapper quoteMapper,
  }) : _quoteMapper = quoteMapper;

  final _quotesCollection = FirebaseFirestore.instance.collection(FirebasePath.quotes);
  final QuoteMapper _quoteMapper;

  Future<QuoteEntity> getQuoteOfTheDay() async {
    final dayOfYear = _getDayOfYear();
    final todayQuoteQuery = await _quotesCollection
        .where(QuoteField.dayOfYear, isEqualTo: dayOfYear)
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

  int _getDayOfYear() {
    final today = DateTime.now();
    final currentYear = today.year;
    final daysFromStartOfYear = today.difference(DateTime(currentYear)).inDays + 1;
    return daysFromStartOfYear;
  }
}
