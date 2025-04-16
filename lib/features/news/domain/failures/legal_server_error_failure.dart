import 'package:olkon_test_work/core/architecture/domain/entity/failure.dart';

/// {@template legal_server_error_failure.class}
/// Failure for not OK API response, but not DioException
/// {@endtemplate}
final class LegalServerErrorFailure extends Failure {
  LegalServerErrorFailure({String? message, int? code, super.trace = null})
      : super(
          original: '$code $message',
        );
}
