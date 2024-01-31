import 'package:meow_films/core/Exception/getmovie_exception.dart';

import 'package:meow_films/features/home_page/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

final class Page6MovieUsecase {
  final MovieRepository repository;
  Page6MovieUsecase({required this.repository});

  Future<List<MovieEntity>> call() async {
    try {
      return await repository.page6();
    } catch (e) {
      throw GetMovieException("error Ferching Movie");
    }
  }
}
