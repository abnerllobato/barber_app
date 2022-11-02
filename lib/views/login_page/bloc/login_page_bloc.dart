import 'dart:async';

import 'package:barbearia_app/locator.dart';
import 'package:barbearia_app/services/issues_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../repositories/auth_repository.dart';
import '../../../repositories/auth_repository_firebase.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  var _authRepository = serviceLocator.get<AuthRepository>();

  LoginPageBloc() : super(const LoginPageState.unauthenticated()) {
    _authRepository = FirebaseAuthRepository();
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
        emit(LoginPageState.errorState(
            errorMessage: IssueService.getMessagesFromFirebaseCode(e.code)));
      }
    }
  }

  _onLogoutRequested() {
    _authRepository.logOut();
    emit(const LoginPageState.logoutState());
    emit(const LoginPageState.unauthenticated());
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
