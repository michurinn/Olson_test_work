import 'package:dio/dio.dart';

/// {@template failure.class}
/// The failure processed in the business logic layer of the application.
///
/// It is mostly returned from repository methods.
/// {@endtemplate}
base class Failure<T extends Object?> implements Exception {
  /// Original error.
  final T original;

  /// Stack Trace.
  final StackTrace? trace;

  /// {@macro failure.class}
  const Failure({
    required this.original,
    required this.trace,
  });
}

final class DioFaiture extends Failure {
  final DioException exception;
  DioFaiture({
    required this.exception,
  }) : super(original: exception, trace: null);
}
