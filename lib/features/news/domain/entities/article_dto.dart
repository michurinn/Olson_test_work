import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:olkon_test_work/typedefs/json_typedef.dart';

part 'article_dto.freezed.dart';
part 'article_dto.g.dart';
/// {@template article_dto.class}
/// Specific news received from the API with an OK response 
/// {@endtemplate}

@freezed
class ArticleDto with _$ArticleDto {
  const ArticleDto._();
  const factory ArticleDto({
    required String? author,
    required String? title,
    required String? description,
    required String? urlToImage,
    required DateTime publishedAt,
    required String? content,
  }) = _ArticleDto;

  factory ArticleDto.fromJson(Json json) => _$ArticleDtoFromJson(json);

  /// To eliminate date and time errors 
  @override
  int get hashCode => Object.hash(runtimeType, author, title);
}
