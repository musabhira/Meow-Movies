import 'package:meow_films/features/domain/entites/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
  Future<List<MovieEntity>> fetchTrendingMovies();
  Future<List<MovieEntity>> page5();
  Future<List<MovieEntity>> page6();
  Future<List<MovieEntity>> page7();
  Future<void> storeFavoriteFirebase(MovieEntity entity);
}
