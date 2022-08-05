import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:wise_dev/pages/home/viewmodel/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required QuoteRepository quoteRepository,
  })  : _quoteRepository = quoteRepository,
        super(const HomeState.loading()) {
    _loadData();
  }

  final QuoteRepository _quoteRepository;

  _loadData() async {
    _quoteRepository
        .getQuoteOfTheDay()
        .then((quote) => emit(HomeState.data(quote)))
        .onError((error, stackTrace) => emit(const HomeState.error()));
  }
}
