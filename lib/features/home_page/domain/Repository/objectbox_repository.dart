import 'package:meow_films/features/home_page/Data/Models/objectbox_entity.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

abstract class ObjectBoxMovieRepository {
  void addAllMovies(List<MovieEntity> entity);
  void clearAllMovies();
  List<MovieEntity> getAllMovies();
}
