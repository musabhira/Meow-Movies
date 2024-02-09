import 'package:meow_films/core/objectbox/movie_objectbox.dart';
import 'package:meow_films/core/utils/api_utils.dart';
import 'package:meow_films/features/home_page/Data/Data%20Source/objectbox_datasource.dart';
import 'package:meow_films/features/home_page/Data/Models/objectbox_entity.dart';

import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'object_box_dataSource_impl.g.dart';

class ObjectBoxDatasourceImpl implements ObjectBoxDatasource {
  final movieBox = MovieStoreObjectBox.instance.box;
  @override
  void addAllMovies(List<ObjectBoxMovieEntityUser> entity) async {
    final dio = Dio(BaseOptions(baseUrl: ApiUtils.page4));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cahced_images';

    for (final movie in entity) {
      final posterPathLocation = '$cacheDirectory${movie.posterPath}';
      final backdropPathLocation = '$cacheDirectory${movie.backdropPath}';

      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backdropPathLocation);

      movie.posterPath = posterPathLocation;
      movie.backdropPath = backdropPathLocation;

      movieBox.put(movie);
    }
  }

  @override
  void clearAllMovies() {
    movieBox.removeAll();
  }

  @override
  List<ObjectBoxMovieEntityUser> getAllMovies() {
    return movieBox.getAll();
  }
}

@riverpod
ObjectBoxDatasource objectBoxDatasource(ObjectBoxDatasourceRef ref) {
  return ObjectBoxDatasourceImpl();
}
