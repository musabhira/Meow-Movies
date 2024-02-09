import 'package:meow_films/core/Exception/base_exception.dart';
import 'package:meow_films/features/home_page/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

final class SearchMovieUsecase {
  final MovieRepository repository;
  SearchMovieUsecase({required this.repository});

  Future<List<MovieEntity>> call(String text) async {
    try {
      return await repository.searchMovies(text);
    } catch (e) {
      throw BaseException('Failed to load Movies');
    }
  }
}
