import 'package:meow_films/core/Exception/base_exception.dart';
import 'package:meow_films/core/utils/api_utils.dart';
import 'package:meow_films/features/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/domain/entites/movie_entity.dart';

// class MovieApiUsecase {
//   final MovieRepository repository;
//   MovieApiUsecase({required this.repository});
//   Future<List<MovieEntity>> call() async {
//     try {
//       return repository.allmovies(ApiUtils.moviesUrl);
//     } catch (e) {
//       throw BaseException(e.toString());
//     }
//   }
// }
