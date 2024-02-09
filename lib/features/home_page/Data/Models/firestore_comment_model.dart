import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_comment_model.freezed.dart';
part 'firestore_comment_model.g.dart';

@freezed
class FireStoreCommentModel with _$FireStoreCommentModel {
  const FireStoreCommentModel._();
  factory FireStoreCommentModel({
    required String username,
    required String comment,
    required DateTime time,
  }) = _FireStoreCommentModel;
  factory FireStoreCommentModel.fromJson(Map<String, dynamic> json) =>
      _$FireStoreCommentModelFromJson(json);

  factory FireStoreCommentModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return FireStoreCommentModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
