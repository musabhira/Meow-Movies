import 'package:meow_films/core/Exception/base_exception.dart';
import 'package:meow_films/features/home_page/domain/Repository/movie_repository.dart';

class RemoveFavMoviesFromFirestoreUsecase {
  final MovieRepository repository;
  RemoveFavMoviesFromFirestoreUsecase({required this.repository});
  Future<void> call(String id) {
    try {
      return repository.removeFavMoviesFromFirestore(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
