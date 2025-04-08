import 'package:dio/dio.dart';
import 'package:olkon_test_work/architecture/domain/entity/request_operation.dart';
import 'package:olkon_test_work/core/architecture/data/converter/converter.dart';
import 'package:olkon_test_work/core/architecture/domain/entity/failure.dart';
import 'package:olkon_test_work/core/architecture/domain/entity/result.dart';
import 'package:olkon_test_work/features/news/domain/entities/news_response.dart';
import 'package:olkon_test_work/features/news/domain/repositories/i_news_repository.dart';
import 'package:olkon_test_work/typedefs/json_typedef.dart';
import 'package:olkon_test_work/urls/urls.dart';

final class NewsRepository implements INewsRepository {
  final Dio dio;
  final Converter<Result<NewsOkResponse, Failure>, Json> responseConverter;
  final String apiKey;

  NewsRepository({
    required this.dio,
    required this.responseConverter,
    required this.apiKey,
  });

  @override
  RequestOperation<NewsOkResponse> getNews(
      {int pageSize = 20, int page = 0}) async {
    try {
      final response = await dio.get(Urls.newsUrl, queryParameters: {
        'page': page,
        'pageSize': pageSize,
        'apiKey': apiKey,
        'country': 'us',
      });
      final data = responseConverter.convert(response.data as Json);
      return switch (data) {
        ResultOk(:final data) => ResultOk(data),
        ResultFailed<NewsOkResponse, Failure<Object?>>() =>
          throw UnimplementedError(),
      };
    } on DioException catch (e) {
      return ResultFailed(
        DioFaiture(exception: e),
      );
    } on Object catch (e, st) {
      return ResultFailed(
        Failure(original: e, trace: st),
      );
    }
  }
}
