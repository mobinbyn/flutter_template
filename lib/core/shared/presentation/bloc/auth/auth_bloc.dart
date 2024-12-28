import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/app/service/interface/i_authentication_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationService _authenticationService;

  AuthBloc(this._authenticationService) : super(const AuthState(AuthStatus.unknown)) {
    on<AppStarted>((event, emit) async {
      bool isLoggedIn = await _authenticationService.isSignedIn();

      emit(state.copyWith(status: isLoggedIn ? AuthStatus.authenticated : AuthStatus.unauthenticated));
    });

    on<LoginRequested>((event, emit) async {
      var response = await _authenticationService.signIn(event.username, event.password);
      // TODO Export data from response
      AuthError error = AuthError.unknown;

      response.fold(
        (failure) {
          emit(state.copyWith(status: AuthStatus.unauthenticated, error: error));
        },
        (result) {
          emit(state.copyWith(status: AuthStatus.authenticated, authModel: result));
        },
      );
    });

    on<LogoutRequested>((event, emit) async {
      await _authenticationService.signOut();
    });
  }
}
