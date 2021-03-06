part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
    this.surveyComplete = false,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user, bool surveyComplete)
      : this._(status: AuthenticationStatus.authenticated, user: user, surveyComplete: surveyComplete);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;
  final bool surveyComplete;

  @override
  List<Object> get props => [status, user, surveyComplete];
}
