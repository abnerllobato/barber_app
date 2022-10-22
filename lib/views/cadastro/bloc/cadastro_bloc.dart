import 'package:barbearia_app/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'cadastro_event.dart';
part 'cadastro_state.dart';

class CadastroBloc extends Bloc<CadastroEvent, CadastroState> {
  late AuthRepository _authRepository;

  final _data = DateTime.now().toString();

  CadastroBloc() : super(CadastroInitial()) {
    _authRepository = AuthRepository();
    on<CadastroButtonEvent>((event, emit) => _onPressed(event));
  }

  Future<void> _onPressed(
    CadastroButtonEvent event,
  ) async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(CadastroLoading());
    try {
      await _authRepository.signup(
          email: event.email,
          password: event.password,
          name: event.name,
          dataCriacao: _data,
          dataModificacao: _data,
          nivel: 'cliente');
      emit(CadastroSuccessState(name: event.name));
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          emit(CadastroFailed(errorMessage: 'E-mail já esta em uso'));
        } else if (e.code == 'invalid-email') {
          emit(CadastroFailed(errorMessage: 'E-mail Invalido'));
        } else if (e.code == 'weak-password') {
          emit(CadastroFailed(errorMessage: 'Senha Muito Fraca'));
        } else {
          emit(CadastroSuccessState(name: event.name));
        }
      }
    }
  }
}
