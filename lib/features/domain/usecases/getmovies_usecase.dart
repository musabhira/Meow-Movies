import 'package:meow_films/core/Exception/getmovie_exception.dart';
import 'package:meow_films/features/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/domain/entites/movie_entity.dart';

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
