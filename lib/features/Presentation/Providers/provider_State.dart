import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meow_films/features/domain/entites/movie_entity.dart';

part 'provider_State.freezed.dart';

@freezed
class ProviderState with _$ProviderState {
  factory ProviderState({
    required List<MovieEntity> movies,
    required List<MovieEntity> trending,
  }) = _ProviderState;
}
