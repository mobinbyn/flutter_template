part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated, guest }

enum AuthError { unknown, hostUnreachable, wrongEmailOrPassword }

class AuthState extends Equatable {
  final AuthStatus status;
  final bool isFirstEntry;
  final AuthModel? authModel;
  final AuthError? error;

  const AuthState(this.status, {this.authModel, this.error, this.isFirstEntry = true});

  @override
  List<Object> get props => [status, authModel!];

  AuthState copyWith({
    AuthStatus? status,
    AuthModel? authModel,
    AuthError? error,
  }) {
    return AuthState(
      status ?? this.status,
      authModel: authModel ?? this.authModel,
      error: error ?? this.error,
    );
  }
}

class AuthModel extends Equatable {
  final User? user;
  final bool isAuthenticated;

  const AuthModel({required this.isAuthenticated, this.user});

  @override
  List<Object?> get props => [user, isAuthenticated];
}

class User extends Equatable {
  final String id;
  final String name;

  const User({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
