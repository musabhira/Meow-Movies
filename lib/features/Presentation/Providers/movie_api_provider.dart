import 'package:meow_films/features/Data/Data%20Source/movies_api_data.dart';
import 'package:meow_films/features/Data/Models/api_model.dart';
import 'package:meow_films/features/Data/Repository/movie_repository_impl.dart';
import 'package:meow_films/features/domain/Repository/movie_repository.dart';
import 'package:meow_films/features/domain/entites/movie_entity.dart';
import 'package:meow_films/features/domain/usecases/getmovies_usecase.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_api_provider.g.dart';

@riverpod
class Movie extends _$Movie {
  late final MovieRepository repository;
  @override
  Future<List<MovieEntity>> build() async {
    repository = ref.watch(movieRepositoryProvider);
    return GetMoviesUseCase(repository: repository)();
  }
}
