import 'package:meow_films/core/Exception/base_exception.dart';
import 'package:meow_films/features/home_page/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

class GetFavMoviesFromFirestoreUsecase {
  final MovieRepository repository;
  GetFavMoviesFromFirestoreUsecase({required this.repository});
  Stream<List<MovieEntity>> call() {
    try {
      return repository.getFavMoviesFromFirestore();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
