import 'package:meow_films/core/Exception/Auth/invalid_exception.dart';
import 'package:meow_films/core/Exception/base_exception.dart';

import 'package:meow_films/features/home_page/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/home_page/domain/entites/review_entity.dart';

class AddtoCommentUsecase {
  final MovieRepository repository;
  AddtoCommentUsecase({required this.repository});
  Future<void> call(ReviewEntity reviewEntity, String id) async {
    if (reviewEntity.review.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      return repository.addToComment(reviewEntity, id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
