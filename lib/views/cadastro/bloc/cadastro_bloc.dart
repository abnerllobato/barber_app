import 'package:barbearia_app/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:barbearia_app/services/issues_service.dart';

part 'cadastro_event.dart';
part 'cadastro_state.dart';

class CadastroBloc extends Bloc<CadastroEvent, CadastroState> {
  late AuthRepository _authRepository;

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
      );
      emit(CadastroSuccessState(name: event.name));
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(CadastroFailed(
            errorMessage: IssueService.getMessagesFromFirebaseCode(e.code)));
      }
    }
  }
}
