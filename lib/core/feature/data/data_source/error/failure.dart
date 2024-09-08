import 'package:equatable/equatable.dart';
import 'response_code.dart';

typedef FailureMetadata = ({int statusCode, int code, String description});

class Failure extends Equatable {
  final String message;
  final FailureMetadata? metadata;

  const Failure(this.message, {this.metadata});

  @override
  List<Object> get props => [message, metadata!];
}

class DefaultFailure extends Failure {
  const DefaultFailure() : super(ResponseMessage.defaultError);
}
