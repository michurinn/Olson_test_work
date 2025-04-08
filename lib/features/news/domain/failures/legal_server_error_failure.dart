import 'package:olkon_test_work/core/architecture/domain/entity/failure.dart';

final class LegalServerErrorFailure extends Failure {
  LegalServerErrorFailure({String? message, int? code, super.trace = null})
      : super(
          original: '$code $message',
        );
}
