import 'package:dio/dio.dart';
import 'package:meow_films/features/Data/Data%20Source/movies_serives_datasource.dart';
import 'package:meow_films/features/Data/Models/api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movies_api_data.g.dart';

class MovieService implements ApiServicesDataSource {
  final token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZmE5M2RmNzkwN2MwZDk1OTBmMzJiYWY0ZGI0NjFhZCIsInN1YiI6IjY1OWY4YmZhODQ0NDhlMDEyZDEwYmQ1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vodouZkDRORccoc_FR9ppUvDoP80sTtG2Mp9K__s7XA';

  static final Dio dio = Dio();
  @override
  Future<ApiModel> getMovies() async {
    const url = 'https://api.themoviedb.org/3/discover/movie';
    dio.options.headers['Authorization'] = 'Bearer $token';

    Response response = await dio.get(url);
    // try {
    //   final response = await dio.get(
    //     url,
    //     options: Options(headers: {'Authorization': 'Bearer $token'}),
    //   );

    //   if (response.statusCode == 200) {
    //     final data = response.data;
    //     print(data);
    //     final movies = <ApiModel>[];
    //     for (final result in data['results']) {
    //       movies.add(ApiModel.fromJson(result));
    //     }

    return ApiModel.fromJson(response.data);
    //   }
    // } catch (e) {
    //   log(e.toString());
    // }
  }
}

@riverpod
ApiServicesDataSource apiDataSource(ApiDataSourceRef ref) {
  return MovieService();
}
