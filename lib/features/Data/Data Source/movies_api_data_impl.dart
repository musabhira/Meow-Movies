import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'package:meow_films/core/utils/api_utils.dart';
import 'package:meow_films/features/Data/Data%20Source/movies_api_datai.dart';
import 'package:meow_films/features/Data/Models/api_model.dart';
import 'package:meow_films/features/Data/Models/firestore_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movies_api_data_impl.g.dart';

class MovieService implements ApiServicesDataSource {
  final token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZmE5M2RmNzkwN2MwZDk1OTBmMzJiYWY0ZGI0NjFhZCIsInN1YiI6IjY1OWY4YmZhODQ0NDhlMDEyZDEwYmQ1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vodouZkDRORccoc_FR9ppUvDoP80sTtG2Mp9K__s7XA';
  final trendingMoviesurl = ApiUtils.trendingMoviesurl;
  final page4 = ApiUtils.page4;
  final pageof5 = ApiUtils.page5;
  final pageof6 = ApiUtils.page6;
  final pageof7 = ApiUtils.page7;
  static final Dio dio = Dio();
  final db = FirebaseFirestore.instance;

  @override
  Future<ApiModel> getMovies() async {
    const url =
        'https://api.themoviedb.org/3/discover/movie?page=1&include_video=true';
    dio.options.headers['Authorization'] = 'Bearer $token';

    Response response = await dio.get(url);
    return ApiModel.fromJson(response.data);
  }

  @override
  Future<ApiModel> fetchTrendingMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';

    Response response = await dio.get(page4);
    return ApiModel.fromJson(response.data);
  }

  @override
  Future<ApiModel> page5() async {
    dio.options.headers['Authorization'] = 'Bearer $token';

    Response response = await dio.get(pageof5);
    return ApiModel.fromJson(response.data);
  }

  @override
  Future<ApiModel> page6() async {
    dio.options.headers['Authorization'] = 'Bearer $token';

    Response response = await dio.get(pageof6);
    return ApiModel.fromJson(response.data);
  }

  @override
  Future<ApiModel> page7() async {
    dio.options.headers['Authorization'] = 'Bearer $token';

    Response response = await dio.get(pageof7);
    return ApiModel.fromJson(response.data);
  }

  @override
  Future<void> storeFavoriteFirebase(FireStoreModel model) async {
    db.collection('favorite').doc(model.id).set(model.toFirestore());
  }
}

@riverpod
ApiServicesDataSource apiDataSource(ApiDataSourceRef ref) {
  return MovieService();
}
