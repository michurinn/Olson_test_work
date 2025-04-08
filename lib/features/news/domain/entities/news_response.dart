import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:olkon_test_work/features/news/domain/entities/article.dart';

part 'news_response.freezed.dart';

@freezed
class NewsOkResponse with _$NewsOkResponse {
  const factory NewsOkResponse(
      {required int totalResults,
      required List<Article> articles}) = _NewsOkResponse;
}
