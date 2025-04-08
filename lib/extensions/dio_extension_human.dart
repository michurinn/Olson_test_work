import 'package:dio/dio.dart';
import 'package:olkon_test_work/typedefs/json_typedef.dart';

extension DioExceptionHuman on DioException {
  String humanMode() {
    if (type == DioExceptionType.sendTimeout ||
        type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.receiveTimeout) {
      return 'uri: ${requestOptions.uri} CONNECTION TIMEOUT';
    } else if (type == DioExceptionType.connectionError) {
      return 'Проверьте соединение с интернетом';
    } else {
      return 'uri: ${requestOptions.uri} /n statusCode: ${response?.statusCode} /n error: ${response?.data is Json && (response?.data as Json).containsKey('error') ? (response?.data as Json)['error'] : {
          response?.data
        }}';
    }
  }

  String userMode() {
    if (type == DioExceptionType.sendTimeout ||
        type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.receiveTimeout) {
      return 'uri: ${requestOptions.uri}/nCONNECTION TIMEOUT';
    } else {
      return response?.data is Json &&
              (response?.data as Json).containsKey('error')
          ? (response?.data as Json)['error']
          : 'ERROR: ${response?.data}';
    }
  }
}
