import 'package:meow_films/features/Data/Data%20Source/movies_api_data_impl.dart';
import 'package:meow_films/features/Data/Data%20Source/movies_api_datai.dart';
import 'package:meow_films/features/Data/Models/firestore_model.dart';

import 'package:meow_films/features/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/domain/entites/movie_entity.dart';
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
            backdropPath: results.backdropPath,
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
            backdropPath: results.backdropPath,
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
        id: entity.id.toString(),
        originalTitle: entity.originalTitle,
        overview: entity.overview,
        posterPath: entity.posterPath,
        backdropPath: entity.backdropPath,
        title: entity.title,
        voteAverage: entity.voteAverage,
        releaseDate: entity.releaseDate);
    await dataSource.storeFavoriteFirebase(model);
  }
}

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return MovieRepositoryImpl(dataSource: ref.watch(apiDataSourceProvider));
}
