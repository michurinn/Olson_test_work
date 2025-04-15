import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@freezed
class CommentEntity with _$CommentEntity {
  const factory CommentEntity({
    required int id,
    required int articleId,
    required DateTime date,
    String? userName,
    required String text,
  }) = _CommentEntity;
}
