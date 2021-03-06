import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fethr/model/user.dart';
import 'package:fethr/repositories/authentication_repository/authentication_repository.dart';
import 'package:meta/meta.dart';
import 'package:pedantic/pedantic.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AuthenticationUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<User> _userSubscription;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationUserChanged) {
      bool surveyComplete = false;
      try {
        var snapshot = await firebaseFirestore
            .collection('users')
            .doc(event.user.id ?? '')
            .get();
        surveyComplete = snapshot.data()['surveyComplete'];
      } catch (_) {}
      yield _mapAuthenticationUserChangedToState(event, surveyComplete);
    } else if (event is AuthenticationLogoutRequested) {
      unawaited(_authenticationRepository.logOut());
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  AuthenticationState _mapAuthenticationUserChangedToState(
    AuthenticationUserChanged event,
    bool surveyComplete,
  ) {
    print('EY: $surveyComplete');
    return event.user != User.empty
        ? AuthenticationState.authenticated(event.user, surveyComplete)
        : const AuthenticationState.unauthenticated();
  }
}
