import 'package:entity/entity.dart';

abstract class QuoteDataSource {
  Future<Iterable<QuoteEntity>> getQuotes();
}
