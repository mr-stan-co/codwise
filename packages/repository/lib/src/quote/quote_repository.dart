import 'package:entity/entity.dart';
import 'package:repository/src/quote/quote_data_source.dart';

class QuoteRepository {
  QuoteRepository({
    required QuoteDataSource quoteDataSource,
  }) : _quoteDataSource = quoteDataSource;

  final QuoteDataSource _quoteDataSource;

  Future<Iterable<QuoteEntity>> getQuotes() => _quoteDataSource.getQuotes();
}
