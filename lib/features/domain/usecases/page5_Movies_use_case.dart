import 'package:meow_films/core/Exception/getmovie_exception.dart';
import 'package:meow_films/features/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/domain/entites/movie_entity.dart';

final class Page5MovieUsecase {
  final MovieRepository repository;
  Page5MovieUsecase({required this.repository});

  Future<List<MovieEntity>> call() async {
    try {
      return await repository.page5();
    } catch (e) {
      throw GetMovieException("error Ferching Movie");
    }
  }
}
