import 'package:meow_films/features/Data/Repository/movie_repository_impl.dart';
import 'package:meow_films/features/Presentation/Providers/provider_State.dart';
import 'package:meow_films/features/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/domain/entites/movie_entity.dart';

import 'package:meow_films/features/domain/usecases/getmovies_usecase.dart';
import 'package:meow_films/features/domain/usecases/trending_movies_usecase.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_api_provider.g.dart';

@riverpod
class Movie extends _$Movie {
  late final MovieRepository repository;
  @override
  Future<ProviderState> build() async {
    final result = await Future.wait([getMovies(), fetchTrendingMovies()]);
    return ProviderState(movies: result[0], trending: result[1]);
  }

  Future<List<MovieEntity>> getMovies() {
    return GetMoviesUseCase(repository: ref.watch(movieRepositoryProvider))();
  }

  Future<List<MovieEntity>> fetchTrendingMovies() {
    return TrendingMovieUsecase(
        repository: ref.watch(movieRepositoryProvider))();
  }
}
