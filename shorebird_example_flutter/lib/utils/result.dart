import 'package:shorebird_example_flutter/core/errors/failure.dart';

sealed class Result<T> {
  const Result();

  factory Result.ok(T value) => Ok(value);
  factory Result.error(Failure value) => Error._(value);
}

class Ok<T> extends Result<T> {
  const Ok(this.value);

  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

class Error<T> extends Result<T> {
  const Error._(this.error);

  final Failure error;

  @override
  String toString() => 'Result<$T>.error($error)';
}
