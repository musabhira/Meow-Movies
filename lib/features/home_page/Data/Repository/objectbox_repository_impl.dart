import 'package:meow_films/features/home_page/Data/Data%20Source/object_box_dataSource_impl.dart';
import 'package:meow_films/features/home_page/Data/Data%20Source/objectbox_datasource.dart';
import 'package:meow_films/features/home_page/Data/Models/objectbox_entity.dart';
import 'package:meow_films/features/home_page/domain/Repository/objectbox_repository.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_repository_impl.g.dart';

class ObjectBoxMovieRepositoryImpl implements ObjectBoxMovieRepository {
  final ObjectBoxDatasource datasource;
  ObjectBoxMovieRepositoryImpl({required this.datasource});

  @override
  void clearAllMovies() {
    datasource.clearAllMovies();
  }

  @override
  List<MovieEntity> getAllMovies() {
    final models = datasource.getAllMovies();
    return [
      for (final moviemodels in models)
        MovieEntity(
          title: moviemodels.title ?? '',
          id: moviemodels.id,
          overview: moviemodels.overview ?? '',
          backdropPath: moviemodels.backdropPath ?? '',
          posterPath: moviemodels.posterPath ?? '',
          releaseDate: moviemodels.releaseDate!,
          voteAverage: moviemodels.voteAverage ?? 0,
          originalTitle: moviemodels.originalTitle ?? '',
          voteCount: moviemodels.voteCount!,
        )
    ];
  }

  @override
  void addAllMovies(List<MovieEntity> entity) {
    final moviemodel = [
      for (final movie in entity)
        ObjectBoxMovieEntityUser(
            title: movie.title,
            movieid: movie.id,
            backdropPath: movie.backdropPath,
            originalTitle: movie.originalTitle,
            overview: movie.overview,
            posterPath: movie.posterPath,
            releaseDate: movie.releaseDate,
            voteAverage: movie.voteAverage,
            voteCount: movie.voteCount)
    ];
    datasource.addAllMovies(moviemodel);
  }
}

@riverpod
ObjectBoxMovieRepository objectBoxMovieRepository(
    ObjectBoxMovieRepositoryRef ref) {
  return ObjectBoxMovieRepositoryImpl(
      datasource: ref.watch(objectBoxDatasourceProvider));
}
