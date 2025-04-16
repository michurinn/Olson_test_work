import 'package:olkon_test_work/core/architecture/domain/entity/failure.dart';

/// {@template convert_failure.class}
/// Error while converting
/// {@endtemplate}
base class ConvertFailure extends Failure {
  /// Message.
  final String? message;

  /// {@macro api_failure.class}
  const ConvertFailure({
    required super.original,
    required super.trace,
    this.message,
  });
}
