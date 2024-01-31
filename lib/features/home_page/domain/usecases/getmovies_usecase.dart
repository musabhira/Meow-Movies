import 'package:meow_films/core/Exception/getmovie_exception.dart';

import 'package:meow_films/features/home_page/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

final class GetMoviesUseCase {
  final MovieRepository repository;
  GetMoviesUseCase({required this.repository});

  Future<List<MovieEntity>> call() async {
    try {
      return await repository.getMovies();
    } catch (e) {
      throw GetMovieException("error Ferching Movie");
    }
  }
}
