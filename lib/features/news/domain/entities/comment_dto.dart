import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_dto.freezed.dart';

/// {@template comment_dto.class}
/// The Comment on the news. For recording
/// {@endtemplate}
@freezed
class CommentDto with _$CommentDto {
  const factory CommentDto({
    required int articleId,
    required DateTime date,
    String? userName,
    required String text,
  }) = _CommentDto;
}
