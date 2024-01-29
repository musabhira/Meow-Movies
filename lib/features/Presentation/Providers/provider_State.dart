import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meow_films/features/domain/entites/movie_entity.dart';

part 'provider_State.freezed.dart';

@freezed
class ProviderState with _$ProviderState {
  factory ProviderState({
    required List<MovieEntity> movies,
    required List<MovieEntity> trending,
    required List<MovieEntity> page5,
    required List<MovieEntity> page6,
    required List<MovieEntity> page7,
  }) = _ProviderState;
}
