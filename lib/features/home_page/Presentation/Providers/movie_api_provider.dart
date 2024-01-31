import 'package:meow_films/features/home_page/Data/Repository/movie_repository_impl.dart';
import 'package:meow_films/features/home_page/Presentation/Providers/provider_State.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';
import 'package:meow_films/features/home_page/domain/usecases/AddToFirestore_Usecase.dart';
import 'package:meow_films/features/home_page/domain/usecases/getmovies_usecase.dart';
import 'package:meow_films/features/home_page/domain/usecases/page5_Movies_use_case.dart';
import 'package:meow_films/features/home_page/domain/usecases/page6_Movies_use_case.dart';
import 'package:meow_films/features/home_page/domain/usecases/page7_Movies_use_case.dart';
import 'package:meow_films/features/home_page/domain/usecases/trending_movies_usecase.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_api_provider.g.dart';

@riverpod
class Movie extends _$Movie {
  @override
  Future<ProviderState> build() async {
    final result = await Future.wait(
        [getMovies(), fetchTrendingMovies(), page5(), page6(), page7()]);
    return ProviderState(
        movies: result[0],
        trending: result[1],
        page5: result[2],
        page6: result[3],
        page7: result[4]);
  }

  Future<List<MovieEntity>> getMovies() {
    return GetMoviesUseCase(repository: ref.watch(movieRepositoryProvider))();
  }

  Future<List<MovieEntity>> fetchTrendingMovies() {
    return TrendingMovieUsecase(
        repository: ref.watch(movieRepositoryProvider))();
  }

  Future<List<MovieEntity>> page5() {
    return Page5MovieUsecase(repository: ref.watch(movieRepositoryProvider))();
  }

  Future<List<MovieEntity>> page6() {
    return Page6MovieUsecase(repository: ref.watch(movieRepositoryProvider))();
  }

  Future<List<MovieEntity>> page7() {
    return Page7MovieUsecase(repository: ref.watch(movieRepositoryProvider))();
  }

  Future<void> addToFiresore(MovieEntity entity) {
    return AddtoFirestoreUsecase(
        repository: ref.watch(movieRepositoryProvider))(entity);
  }
}
