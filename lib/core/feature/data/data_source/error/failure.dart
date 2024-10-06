import 'package:equatable/equatable.dart';
import 'response_code.dart';

/// A typedef for failure metadata that holds information about the status code,
/// error code, and a description of the failure.
typedef FailureMetadata = ({int statusCode, int code, String description});

/// A class representing a failure in the application.
/// Extends [Equatable] to enable value comparison between failure objects.
class Failure extends Equatable {
  final String message; // A message describing the failure.
  final FailureMetadata? metadata; // Additional metadata about the failure, optional.

  const Failure(this.message, {this.metadata});

  /// Overrides [Equatable]'s props to include the message and metadata for comparison.
  @override
  List<Object> get props => [message, metadata!]; // Forces metadata to be non-null.
}

/// A subclass of [Failure] representing a default failure case.
/// Uses a default error message from [ResponseMessage].
class DefaultFailure extends Failure {
  const DefaultFailure() : super(ResponseMessage.defaultError); // Calls the parent class with a default message.
}
