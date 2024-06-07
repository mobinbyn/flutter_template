import 'package:equatable/equatable.dart';
import 'response_code.dart';

class Failure extends Equatable {
  final int code;
  final String message;

  const Failure(this.code, this.message);

  @override
  List<Object> get props => [code, message];
}

class DefaultFailure extends Failure {
  const DefaultFailure()
      : super(ResponseCode.defaultError, ResponseMessage.defaultError);
}
