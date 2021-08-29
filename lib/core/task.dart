import 'package:equatable/equatable.dart';
import 'package:flutter_weather_app/core/errors/failures.dart';

class Task<T> extends Equatable {
  final T? data;
  final Failure? failure;

  Task._({this.data, this.failure});

  factory Task.success(T result) {
    return Task._(data: result);
  }

  factory Task.error(Failure failure) {
    return Task._(failure: failure);
  }

  void fold({required Function(T) onSuccess, Function(Failure)? onError}) {
    if (data != null) {
      onSuccess(data!);
    } else if (failure != null) {
      onError?.call(failure!);
    }
  }

  @override
  List<Object?> get props => [data, failure];
}
