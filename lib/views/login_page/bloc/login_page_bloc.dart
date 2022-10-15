import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';

import '../../../repositories/auth_repository.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  late AuthRepository _authRepository;

  LoginPageBloc() : super(const LoginPageState.unauthenticated()) {
    _authRepository = AuthRepository();
    on<LoginButtonPressed>((event, emit) => _onUserChanged(event));
    on<SignOutButtonPressed>(((event, emit) => _onLogoutRequested()));
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(const LoginPageState.errorState(
            'Por Favor Entre Com Um E-mail Valido'));
      } else if (event.passwordValue.length < 4) {
        emit(const LoginPageState.errorState(
            'Por Favor Insira Uma Senha Correta'));
      } else {
        emit(const LoginPageState.validState());
      }
    });
  }

  Future<void> _onUserChanged(
    LoginButtonPressed event,
  ) async {
    emit(LoginPageState.loading());
    try {
      await _authRepository.logInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(const LoginPageState.authenticated());
    } catch (e) {
      emit(const LoginPageState.unauthenticated());
    }
  }

  Future<void> _onLogoutRequested() async {
    try {
      await _authRepository.logOut();
      emit(const LoginPageState.unauthenticated());
    } catch (e) {
      emit(const LoginPageState.authenticated());
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
