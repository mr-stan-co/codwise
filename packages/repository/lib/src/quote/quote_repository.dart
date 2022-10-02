import 'package:entity/entity.dart';
import 'package:intl/intl.dart';
import 'package:repository/src/firebase/firebase_data_source.dart';

class QuoteRepository {
  QuoteRepository({
    required FirebaseDataSource firebaseDataSource,
  }) : _firebaseDataSource = firebaseDataSource;

  final FirebaseDataSource _firebaseDataSource;
  final _today = DateTime.now();

  Future<QuoteEntity> getQuoteOfTheDay() async {
    final weekOfYear = _getWeekOfYear();
    final dayOfWeek = _getDayOfWeek();
    return _firebaseDataSource.getQuoteByDay(
      weekOfYear: weekOfYear,
      dayOfWeek: dayOfWeek,
    );
  }

  int _getWeekOfYear() {
    final dayOfYear = int.parse(DateFormat('D').format(_today));
    // Formula from https://en.wikipedia.org/wiki/ISO_week_date#Calculation
    final weekOfYear = ((dayOfYear - _today.weekday + 10) / 7).floor();
    return weekOfYear;
  }

  int _getDayOfWeek() => _today.weekday;
}
