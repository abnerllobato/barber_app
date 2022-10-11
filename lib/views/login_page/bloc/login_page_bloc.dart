import 'dart:async';

import 'package:barbearia_app/models/email.dart';
import 'package:barbearia_app/models/password.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../repositories/auth_repository.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  late AuthRepository _authRepository;

  LoginPageBloc() : super(const LoginPageState.unauthenticated()) {
    _authRepository = AuthRepository();
    on<LoginButtonPressed>((event, emit) => _onUserChanged(event));
    // on<LoginPageLogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onUserChanged(
    LoginButtonPressed event,
  ) async {
    //TODO - Adicionar estado de loading
    emit(LoginPageState.loading());
    //TODO - await Request para FB autenticar
    try {
      await _authRepository.logInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(const LoginPageState.authenticated());
    } catch (e) {
      emit(const LoginPageState.unauthenticated());
    }

    //TODO - Se sucesso retornar estado de sucesse, mesma se falho.
  }

  //void _onLogoutRequested(
  //  LoginPageLogoutRequested event,
  //  Emitter<LoginPageState> emit,
  //) {
  //  unawaited(_authRepository.logOut());
  // }

  @override
  Future<void> close() {
    return super.close();
  }
}
