import 'package:meow_films/features/Data/Models/api_model.dart';
import 'package:meow_films/features/Data/Models/firestore_model.dart';

abstract class ApiServicesDataSource {
  Future<ApiModel> getMovies();
  Future<ApiModel> fetchTrendingMovies();
  Future<ApiModel> page5();
  Future<ApiModel> page6();
  Future<ApiModel> page7();
  Future<void> storeFavoriteFirebase(FireStoreModel model);
}
