import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_dto.freezed.dart';

@freezed
class CommentDto with _$CommentDto {
  const factory CommentDto({
    required int articleId,
    required DateTime date,
    String? userName,
  }) = _CommentDto;
}
