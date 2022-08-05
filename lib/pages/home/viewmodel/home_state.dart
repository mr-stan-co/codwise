import 'package:entity/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = Loading;

  const factory HomeState.error() = Error;

  const factory HomeState.data(QuoteEntity quoteEntity) = Data;
}
