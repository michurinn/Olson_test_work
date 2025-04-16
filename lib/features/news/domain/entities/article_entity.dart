import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_entity.freezed.dart';

part 'article_entity.g.dart';

/// {@template article_entity.class}
/// The essence of the news. Contains the id of the record in the database 
/// {@endtemplate}
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

  factory ArticleEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'publishedAt': publishedAt.toIso8601String(),
        'author': author,
        'title': title,
        'description': description,
        'urlToImage': urlToImage,
        'content': content,
      };
}
