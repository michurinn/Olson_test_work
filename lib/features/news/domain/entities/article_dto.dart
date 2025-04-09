import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:olkon_test_work/typedefs/json_typedef.dart';

part 'article_dto.freezed.dart';
part 'article_dto.g.dart';

@freezed
class ArticleDto with _$ArticleDto {
  const factory ArticleDto({
    required String? author,
    required String? title,
    required String? description,
    required String? urlToImage,
    required DateTime publishedAt,
    required String? content,
  }) = _ArticleDto;

  factory ArticleDto.fromJson(Json json) =>
      _$ArticleDtoFromJson(json);
}
