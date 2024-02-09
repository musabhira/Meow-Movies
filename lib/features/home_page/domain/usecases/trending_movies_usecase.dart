import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meow_films/core/Exception/getmovie_exception.dart';
import 'package:meow_films/core/utils/network_utils.dart';

import 'package:meow_films/features/home_page/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/home_page/domain/Repository/objectbox_repository.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

final class TrendingMovieUsecase {
  final ObjectBoxMovieRepository localrepo;
  final MovieRepository repository;
  TrendingMovieUsecase({required this.repository, required this.localrepo});

  Future<List<MovieEntity>> call() async {
    bool result = await NetworkUtils.hasNetwork();
    try {
      if (result) {
        final datafromApi = await repository.fetchTrendingMovies();
        localrepo.clearAllMovies();
        localrepo.addAllMovies(datafromApi);

        return datafromApi;
      } else {
        final datafromlocal = localrepo.getAllMovies();
        return datafromlocal;
      }
    } catch (e) {
      throw GetMovieException("error Ferching Movie");
    }
  }
}
