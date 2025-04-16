import 'package:olkon_test_work/architecture/domain/entity/request_operation.dart';
import 'package:olkon_test_work/features/news/domain/entities/news_response.dart';

/// {@template i_news_repository.class}
/// Repository for getting a list of news
/// {@endtemplate}
abstract class INewsRepository {
  RequestOperation<NewsOkResponse> getNews({int pageSize = 20, int page = 0});
}
