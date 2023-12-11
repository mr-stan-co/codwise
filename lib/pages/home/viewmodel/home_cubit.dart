import 'dart:math';

import 'package:codwise/pages/home/viewmodel/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required QuoteRepository quoteRepository,
  })  : _quoteRepository = quoteRepository,
        super(HomeState.loading()) {
    _loadQuotes();
  }

  final QuoteRepository _quoteRepository;

  Future<void> _loadQuotes() async {
    try {
      final quotes = await _quoteRepository.getQuotes();
      final randomIndex = Random().nextInt(quotes.length);
      emit(HomeState(HomeStateStatus.quote, quotes, randomIndex));
    } catch (_) {
      emit(HomeState.error());
    }
  }

  nextQuote() {
    emit(state.next());
  }

  previousQuote() {
    emit(state.previous());
  }
}
