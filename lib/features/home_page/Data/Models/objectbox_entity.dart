import 'dart:core';

import 'package:objectbox/objectbox.dart';

@Entity()
class ObjectBoxMovieEntityUser {
  @Id()
  int id = 0;

  String? title;
  int? movieid;
  String? overview;
  String? backdropPath;
  String? posterPath;
  DateTime releaseDate;
  double voteAverage;
  String? originalTitle;
  int? voteCount;
  bool? video;
  bool? adult;

  ObjectBoxMovieEntityUser({
    this.id = 0,
    required this.title,
    required this.movieid,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.originalTitle,
    required this.voteCount,
  });
}
