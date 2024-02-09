import 'package:meow_films/core/Exception/base_exception.dart';
import 'package:meow_films/features/home_page/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/home_page/domain/entites/review_entity.dart';

class GetReviewsFromFirestoreUsecase {
  final MovieRepository repository;
  GetReviewsFromFirestoreUsecase({required this.repository});
  Stream<List<ReviewEntity>> call(String id) {
    try {
      return repository.getReviewsFromFirestore(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
