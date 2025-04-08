import 'package:olkon_test_work/architecture/domain/entity/request_operation.dart';
import 'package:olkon_test_work/features/news/domain/entities/news_response.dart';

abstract class INewsRepository {
  RequestOperation<NewsOkResponse> getNews({int pageSize = 20, int page = 0});
}
