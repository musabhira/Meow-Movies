import 'package:meow_films/features/home_page/Data/Repository/movie_repository_impl.dart';
import 'package:meow_films/features/home_page/domain/entites/trailer_entity.dart';
import 'package:meow_films/features/home_page/domain/usecases/trailer_usecase.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trailer_provider.g.dart';

@riverpod
Future<List<TrailerApiEntity>> trailer(TrailerRef ref, int id) {
  return TrailerUsecase(repository: ref.watch(movieRepositoryProvider))(id);
}
