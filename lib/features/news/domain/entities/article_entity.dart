import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_entity.freezed.dart';

@freezed
class ArticleEntity with _$ArticleEntity {
  const factory ArticleEntity({
    required int id,
    required DateTime publishedAt,
    String? author,
    String? title,
    String? description,
    String? urlToImage,
    String? content,
  }) = _ArticleEntity;
}
