import 'package:meow_films/features/home_page/Data/Data%20Source/movies_api_data_impl.dart';
import 'package:meow_films/features/home_page/Data/Data%20Source/movies_api_datai.dart';

import 'package:meow_films/features/home_page/Data/Models/firestore_comment_model.dart';
import 'package:meow_films/features/home_page/Data/Models/firestore_model.dart';
import 'package:meow_films/features/home_page/Data/Models/trailer_model.dart';
import 'package:meow_films/features/home_page/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';
import 'package:meow_films/features/home_page/domain/entites/review_entity.dart';
import 'package:meow_films/features/home_page/domain/entites/trailer_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_repository_impl.g.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiServicesDataSource dataSource;
  MovieRepositoryImpl({required this.dataSource});
  @override
  Future<List<MovieEntity>> getMovies() async {
    final moon = await dataSource.getMovies();

    late List<MovieEntity> result;
    result = [
      for (final results in moon.results)
        MovieEntity(
            originalTitle: results.originalTitle,
            overview: results.overview,
            posterPath: results.posterPath,
            title: results.title,
            voteAverage: results.voteAverage,
            video: results.video,
            voteCount: results.voteCount,
            id: results.id,
            adult: results.adult,
            releaseDate: results.releaseDate)
    ];
    return result;
  }

  @override
  Future<List<MovieEntity>> fetchTrendingMovies() async {
    final moon = await dataSource.fetchTrendingMovies();

    late List<MovieEntity> result;
    result = [
      for (final results in moon.results)
        MovieEntity(
            originalTitle: results.originalTitle,
            overview: results.overview,
            posterPath: results.posterPath,
            title: results.title,
            voteAverage: results.voteAverage,
            video: results.video,
            voteCount: results.voteCount,
            id: results.id,
            adult: results.adult,
            backdropPath: results.backdropPath,
            releaseDate: results.releaseDate)
    ];
    return result;
  }

  @override
  Future<List<MovieEntity>> page5() async {
    final moon = await dataSource.page5();

    late List<MovieEntity> result;
    result = [
      for (final results in moon.results)
        MovieEntity(
            originalTitle: results.originalTitle,
            overview: results.overview,
            posterPath: results.posterPath,
            title: results.title,
            voteAverage: results.voteAverage,
            video: results.video,
            voteCount: results.voteCount,
            id: results.id,
            adult: results.adult,
            releaseDate: results.releaseDate)
    ];
    return result;
  }

  @override
  Future<List<MovieEntity>> page6() async {
    final moon = await dataSource.page6();

    late List<MovieEntity> result;
    result = [
      for (final results in moon.results)
        MovieEntity(
            originalTitle: results.originalTitle,
            overview: results.overview,
            posterPath: results.posterPath,
            title: results.title,
            voteAverage: results.voteAverage,
            video: results.video,
            voteCount: results.voteCount,
            id: results.id,
            adult: results.adult,
            backdropPath: results.backdropPath,
            releaseDate: results.releaseDate)
    ];
    return result;
  }

  @override
  Future<List<MovieEntity>> page7() async {
    final moon = await dataSource.page7();

    late List<MovieEntity> result;
    result = [
      for (final results in moon.results)
        MovieEntity(
            originalTitle: results.originalTitle,
            overview: results.overview,
            posterPath: results.posterPath,
            title: results.title,
            voteAverage: results.voteAverage,
            video: results.video,
            voteCount: results.voteCount,
            id: results.id,
            adult: results.adult,
            backdropPath: results.backdropPath,
            releaseDate: results.releaseDate)
    ];
    return result;
  }

  @override
  Future<void> storeFavoriteFirebase(MovieEntity entity) async {
    final model = FireStoreModel(
        id: entity.id,
        originalTitle: entity.originalTitle,
        overview: entity.overview,
        posterPath: entity.posterPath,
        title: entity.title,
        voteAverage: entity.voteAverage,
        releaseDate: entity.releaseDate,
        adult: entity.adult!,
        video: entity.video!,
        voteCount: entity.voteCount);
    await dataSource.storeFavoriteFirebase(model);
  }

  @override
  Stream<List<MovieEntity>> getFavMoviesFromFirestore() async* {
    final snapshot = dataSource.getFavMoviesFromFirestore();
    await for (final doc in snapshot) {
      final data = doc.docs;
      yield [
        for (final model in data)
          MovieEntity(
              id: model.data().id,
              adult: model.data().adult,
              backdropPath: model.data().backdropPath,
              video: model.data().video,
              originalTitle: model.data().originalTitle,
              overview: model.data().overview,
              posterPath: model.data().posterPath,
              title: model.data().title,
              voteAverage: model.data().voteAverage,
              releaseDate: model.data().releaseDate,
              voteCount: model.data().voteCount)
      ];
    }
  }

  @override
  Future<void> removeFavMoviesFromFirestore(String id) {
    return dataSource.removeFavMoviesFromFirestore(id);
  }

  @override
  Future<void> addToComment(ReviewEntity reviewEntity, id) async {
    final model = FireStoreCommentModel(
        username: reviewEntity.username,
        comment: reviewEntity.review,
        time: reviewEntity.time);
    await dataSource.addToComment(model, id);
  }

  @override
  Stream<List<ReviewEntity>> getReviewsFromFirestore(String id) async* {
    final snapshot = dataSource.getReviewsFromFirestore(id);
    await for (final doc in snapshot) {
      final data = doc.docs;
      yield [
        for (final model in data)
          ReviewEntity(
              review: model.data().comment,
              username: model.data().username,
              time: model.data().time)
      ];
    }
  }

  @override
  Future<List<MovieEntity>> searchMovies(String text) async {
    final data = await dataSource.searchMovies(text);
    late List<MovieEntity> results;
    results = [
      for (final result in data.results)
        MovieEntity(
            id: result.id,
            adult: result.adult,
            backdropPath: result.backdropPath,
            video: result.video,
            originalTitle: result.originalTitle,
            overview: result.overview,
            posterPath: result.posterPath,
            title: result.title,
            voteAverage: result.voteAverage,
            releaseDate: result.releaseDate,
            voteCount: result.voteCount)
    ];
    return results;
  }

  @override
  Future<List<TrailerApiEntity>> getTrailer(int id) async {
    final data = await dataSource.getTrailer(id);
    late List<TrailerApiEntity> results;
    results = [
      for (final trailer in data.results)
        TrailerApiEntity(
            name: trailer.name,
            key: trailer.key,
            type: trailer.type,
            id: trailer.id)
    ];
    return results;
  }
}

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return MovieRepositoryImpl(dataSource: ref.watch(apiDataSourceProvider));
}
