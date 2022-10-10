import 'dart:async';

import 'package:barbearia_app/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../repositories/auth_repository.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;

  LoginPageBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(
          authRepository.currentUser.isNotEmpty
              ? LoginPageState.authenticated(authRepository.currentUser)
              : const LoginPageState.unauthenticated(),
        ) {
    on<LoginPageUserChanged>(_onUserChanged);
    on<LoginPageLogoutRequested>(_onLogoutRequested);
    _userSubscription = authRepository.user.listen(
      (user) => add(LoginPageUserChanged(user)),
    );
  }

  void _onUserChanged(
    LoginPageUserChanged event,
    Emitter<LoginPageState> emit,
  ) {
    emit(event.user.isNotEmpty
        ? LoginPageState.authenticated(event.user)
        : const LoginPageState.unauthenticated());
  }

  void _onLogoutRequested(
    LoginPageLogoutRequested event,
    Emitter<LoginPageState> emit,
  ) {
    unawaited(_authRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
