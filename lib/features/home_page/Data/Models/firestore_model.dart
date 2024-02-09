import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'firestore_model.freezed.dart';
part 'firestore_model.g.dart';

@freezed
class FireStoreModel with _$FireStoreModel {
  const FireStoreModel._();
  factory FireStoreModel({
    required int id,
    required String originalTitle,
    required String overview,
    required String posterPath,
    String? backdropPath,
    required String title,
    required double voteAverage,
    required DateTime releaseDate,
    required bool adult,
    required bool video,
    required int voteCount,
  }) = _FireStoreModel;
  factory FireStoreModel.fromJson(Map<String, dynamic> json) =>
      _$FireStoreModelFromJson(json);

  factory FireStoreModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return FireStoreModel.fromJson(data);
  }

  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
