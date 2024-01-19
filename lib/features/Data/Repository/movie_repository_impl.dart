import 'package:meow_films/features/Data/Data%20Source/movies_api_data.dart';
import 'package:meow_films/features/Data/Data%20Source/movies_serives_datasource.dart';

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
            voteAverage: results.voteAverage)
    ];
    return result;
  }
}

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return MovieRepositoryImpl(dataSource: ref.watch(apiDataSourceProvider));
}
