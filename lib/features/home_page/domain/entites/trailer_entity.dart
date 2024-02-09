import 'package:freezed_annotation/freezed_annotation.dart';

part 'trailer_entity.freezed.dart';

@freezed
class TrailerApiEntity with _$TrailerApiEntity {
  factory TrailerApiEntity({
    required String name,
    required String key,
    required String type,
    required String id,
  }) = _TrailerApiEntity;
}
