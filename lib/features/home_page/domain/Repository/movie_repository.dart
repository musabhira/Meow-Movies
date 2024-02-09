import 'package:meow_films/features/home_page/Data/Models/trailer_model.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';
import 'package:meow_films/features/home_page/domain/entites/review_entity.dart';
import 'package:meow_films/features/home_page/domain/entites/trailer_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
  Future<List<MovieEntity>> fetchTrendingMovies();
  Future<List<MovieEntity>> page5();
  Future<List<MovieEntity>> page6();
  Future<List<MovieEntity>> page7();
  Future<void> storeFavoriteFirebase(MovieEntity entity);
  Stream<List<MovieEntity>> getFavMoviesFromFirestore();
  Future<void> removeFavMoviesFromFirestore(String id);
  Future<void> addToComment(ReviewEntity reviewEntity, String id);
  Stream<List<ReviewEntity>> getReviewsFromFirestore(String id);
  Future<List<MovieEntity>> searchMovies(String text);
  Future<List<TrailerApiEntity>> getTrailer(int id);
}
