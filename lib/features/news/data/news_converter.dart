import 'package:olkon_test_work/core/architecture/data/converter/converter.dart';
import 'package:olkon_test_work/core/architecture/domain/entity/failure.dart';
import 'package:olkon_test_work/core/architecture/domain/entity/result.dart';
import 'package:olkon_test_work/features/news/domain/entities/article_dto.dart';
import 'package:olkon_test_work/features/news/domain/failures/legal_server_error_failure.dart';
import 'package:olkon_test_work/features/news/domain/entities/news_response.dart';
import 'package:olkon_test_work/typedefs/json_typedef.dart';

final class NewsConverter
    extends Converter<Result<NewsOkResponse, Failure>, Json> {
  @override
  Result<NewsOkResponse, Failure> convert(Json input) {
    if (input.containsKey('status') && input['status'] == 'ok') {
      return ResultOk(
        NewsOkResponse(
            articles: (input['articles'] as List)
                .map((e) => ArticleDto.fromJson(e))
                .toList(),
            totalResults: input['totalResults']),
      );
    } else {
      return ResultFailed(
        LegalServerErrorFailure(
            code: input.containsKey('code') ? input['code'] : null,
            message: input.containsKey('message') ? input['message'] : null),
      );
    }
  }
}
