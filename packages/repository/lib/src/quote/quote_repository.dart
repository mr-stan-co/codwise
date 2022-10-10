import 'package:entity/entity.dart';
import 'package:intl/intl.dart';
import 'package:repository/src/csv_table/csv_data_source.dart';
import 'package:repository/src/quote/quote_data_source.dart';

class QuoteRepository {
  QuoteRepository({
    required QuoteDataSource quoteDataSource,
  }) : _quoteDataSource = quoteDataSource;

  final QuoteDataSource _quoteDataSource;
  final _today = DateTime.now();

  Future<QuoteEntity> getQuoteOfTheDay() async {
    final dayOfWeek = _getDayOfWeek();
    switch (dayOfWeek) {
      case 6:
        return Future.value(_getSaturdayQuote());
      case 7:
        return Future.value(_getSundayQuote());
      default:
        {
          final weekOfYear = _getWeekOfYear();
          return _quoteDataSource.getQuoteByDay(
            weekOfYear: weekOfYear,
            dayOfWeek: dayOfWeek,
          );
        }
    }
  }

  int _getWeekOfYear() {
    final dayOfYear = int.parse(DateFormat('D').format(_today));
    // Formula from https://en.wikipedia.org/wiki/ISO_week_date#Calculation
    final weekOfYear = ((dayOfYear - _today.weekday + 10) / 7).floor();
    return weekOfYear;
  }

  _getDayOfWeek() => _today.weekday;

  WeekendQuoteEntity _getSaturdayQuote() {
    return WeekendQuoteEntity(
      quote: "It's Saturday. Time to take some rest! \n We'll prepare something really great for you on Monday.",
    );
  }

  WeekendQuoteEntity _getSundayQuote() {
    return WeekendQuoteEntity(
      quote: "It's Sunday. The weekend is almost gone. \n See you here tomorrow, we've already prepared some great quote for you.",
    );
  }
}
