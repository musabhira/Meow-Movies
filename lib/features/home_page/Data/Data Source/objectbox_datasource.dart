import 'package:meow_films/features/home_page/Data/Models/objectbox_entity.dart';

abstract class ObjectBoxDatasource {
  void addAllMovies(List<ObjectBoxMovieEntityUser> entity);
  void clearAllMovies();
  List<ObjectBoxMovieEntityUser> getAllMovies();
}
