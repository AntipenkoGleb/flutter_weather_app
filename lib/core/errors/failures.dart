import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  final int statusCode;

  ServerFailure({String? message, required this.statusCode}) : super(message);
  @override
  List<Object?> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  CacheFailure({String? message}) : super(message);
  @override
  List<Object?> get props => [message];
}

class EnviromentFailure extends Failure {
  final String key;
  EnviromentFailure({String? message, required this.key}) : super(message);

  @override
  List<Object?> get props => [message, key];
}
