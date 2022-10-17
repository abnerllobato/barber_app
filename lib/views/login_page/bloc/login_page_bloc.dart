import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../repositories/auth_repository.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  late AuthRepository _authRepository;

  LoginPageBloc() : super(const LoginPageState.unauthenticated()) {
    _authRepository = AuthRepository();
    on<LoginButtonPressed>((event, emit) => _onUserChanged(event));
    on<SignOutButtonPressed>(((event, emit) => _onLogoutRequested()));
  }

  Future<void> _onUserChanged(
    LoginButtonPressed event,
  ) async {
    emit(const LoginPageState.loading());
    try {
      await _authRepository.logInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(const LoginPageState.authenticated());
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'wrong-password') {
          emit(LoginPageState.errorState(errorMessage: 'Senha Incorreta'));
        } else if (e.code == 'invalid-email') {
          emit(LoginPageState.errorState(errorMessage: 'Email Incorreto'));
        } else if (e.code == 'user-not-found') {
          emit(LoginPageState.errorState(
              errorMessage: 'Usuario Não encontrado'));
        }
      }
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
