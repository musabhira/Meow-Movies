import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meow_films/features/home_page/Data/Models/api_model.dart';
import 'package:meow_films/features/home_page/Data/Models/firestore_comment_model.dart';
import 'package:meow_films/features/home_page/Data/Models/firestore_model.dart';
import 'package:meow_films/features/home_page/Data/Models/trailer_model.dart';

abstract class ApiServicesDataSource {
  Future<ApiModel> getMovies();
  Future<ApiModel> fetchTrendingMovies();
  Future<ApiModel> page5();
  Future<ApiModel> page6();
  Future<ApiModel> page7();
  Future<void> storeFavoriteFirebase(FireStoreModel model);
  Stream<QuerySnapshot<FireStoreModel>> getFavMoviesFromFirestore();
  Future<void> removeFavMoviesFromFirestore(String id);
  Future<void> addToComment(FireStoreCommentModel commentModel, String id);
  Stream<QuerySnapshot<FireStoreCommentModel>> getReviewsFromFirestore(
      String id);
  Future<ApiModel> searchMovies(String text);
  Future<TrailerModel> getTrailer(int id);
}
