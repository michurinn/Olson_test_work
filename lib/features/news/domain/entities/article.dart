import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:olkon_test_work/typedefs/json_typedef.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String? author,
    required String? title,
    required String? description,
    required String? urlToImage,
    required DateTime? publishedAt,
    required String? content,
  }) = _Article;

  factory Article.fromJson(Json json) =>
      _$ArticleFromJson(json);
}
