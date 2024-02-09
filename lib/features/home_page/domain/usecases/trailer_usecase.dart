import 'package:dio/dio.dart';
import 'package:meow_films/core/Exception/base_exception.dart';
import 'package:meow_films/features/home_page/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/home_page/domain/entites/trailer_entity.dart';

final class TrailerUsecase {
  final MovieRepository repository;
  TrailerUsecase({required this.repository});
  Future<List<TrailerApiEntity>> call(int id) async {
    try {
      final videos = await repository.getTrailer(id);
      final trialers = videos
          .where((video) => video.type.toLowerCase().trim() == 'trailer')
          .toList();
      return trialers;
    } catch (e) {
      throw BaseException(
          'Error while loading \n ${(e is DioException) ? e.type : e}');
    }
  }
}
