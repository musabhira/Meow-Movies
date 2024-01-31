import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_model.freezed.dart';
part 'api_model.g.dart';

@freezed
class ApiModel with _$ApiModel {
  factory ApiModel({
    @JsonKey(name: "page") required int page,
    @JsonKey(name: "results") required List<Result> results,
    @JsonKey(name: "total_pages") required int totalPages,
    @JsonKey(name: "total_results") required int totalResults,
  }) = _ApiModel;
  factory ApiModel.fromJson(Map<String, Object?> json) =>
      _$ApiModelFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: "adult") required bool adult,
    @JsonKey(name: "backdrop_path") required String backdropPath,
    @JsonKey(name: "genre_ids") required List<int> genreIds,
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "original_language") required String originalLanguage,
    @JsonKey(name: "original_title") required String originalTitle,
    @JsonKey(name: "overview") required String overview,
    @JsonKey(name: "popularity") required double popularity,
    @JsonKey(name: "poster_path") required String posterPath,
    @JsonKey(name: "release_date") required DateTime releaseDate,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "video") required bool video,
    @JsonKey(name: "vote_average") required double voteAverage,
    @JsonKey(name: "vote_count") required int voteCount,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
