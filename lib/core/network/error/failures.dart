import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

 class Failure extends Equatable {
  const Failure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

// class ServerFailure extends Failure {
//
//   const ServerFailure(String errorMessage, this.statusCode)
//       : super(
//           errorMessage,
//         );
//   final int? statusCode;
// }

/// Cancel token failure
class AuthCancelledException implements Exception {}
