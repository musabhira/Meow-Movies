import 'package:meow_films/core/Exception/base_exception.dart';

import 'package:meow_films/features/home_page/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

class AddtoFirestoreUsecase {
  final MovieRepository repository;
  AddtoFirestoreUsecase({required this.repository});
  Future<void> call(MovieEntity entity) async {
    try {
      return repository.storeFavoriteFirebase(entity);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
