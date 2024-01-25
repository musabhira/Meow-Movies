import 'package:meow_films/features/Data/Models/api_model.dart';

abstract class ApiServicesDataSource {
  Future<ApiModel> getMovies();
  Future<ApiModel> fetchTrendingMovies();
}
