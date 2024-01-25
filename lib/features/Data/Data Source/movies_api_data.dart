import 'package:dio/dio.dart';

import 'package:meow_films/core/utils/api_utils.dart';
import 'package:meow_films/features/Data/Data%20Source/movies_serives_datasource.dart';
import 'package:meow_films/features/Data/Models/api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movies_api_data.g.dart';

class MovieService implements ApiServicesDataSource {
  final token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZmE5M2RmNzkwN2MwZDk1OTBmMzJiYWY0ZGI0NjFhZCIsInN1YiI6IjY1OWY4YmZhODQ0NDhlMDEyZDEwYmQ1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vodouZkDRORccoc_FR9ppUvDoP80sTtG2Mp9K__s7XA';
  final trendingMoviesurl = ApiUtils.trendingMoviesurl;
  final page4 = ApiUtils.page4;
  static final Dio dio = Dio();
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
}

@riverpod
ApiServicesDataSource apiDataSource(ApiDataSourceRef ref) {
  return MovieService();
}
