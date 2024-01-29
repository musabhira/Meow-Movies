import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_entity.freezed.dart';

@freezed
class MovieEntity with _$MovieEntity {
  const factory MovieEntity({
    required int id,
    required bool adult,
    required String backdropPath,
    required bool video,
    required String originalTitle,
    required String overview,
    required String posterPath,
    required String title,
    required double voteAverage,
    required DateTime releaseDate,
    required int voteCount,
  }) = _MovieEntity;
}
