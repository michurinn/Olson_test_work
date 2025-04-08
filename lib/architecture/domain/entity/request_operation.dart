import 'package:olkon_test_work/core/architecture/domain/entity/failure.dart';
import 'package:olkon_test_work/core/architecture/domain/entity/result.dart';

/// Typedef for all methods that may fail.
/// These are mostly repository methods.
typedef RequestOperation<T> = Future<Result<T, Failure>>;
