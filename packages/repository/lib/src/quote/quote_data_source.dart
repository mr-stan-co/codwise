import 'package:entity/entity.dart';

abstract class QuoteDataSource {
  Future<WeekdayQuoteEntity> getQuoteByDay({
    required int weekOfYear,
    required int dayOfWeek,
  });
}
