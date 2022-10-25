import 'package:barbearia_app/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:barbearia_app/services/issues_service.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  late AuthRepository _authRepository;

  SignupBloc() : super(SignupInitial()) {
    _authRepository = AuthRepository();
    on<CadastroButtonEvent>((event, emit) => _onPressed(event));
  }

  Future<void> _onPressed(
    CadastroButtonEvent event,
  ) async {
    emit(SignupLoading());
    try {
      await _authRepository.signup(
        email: event.email,
        password: event.password,
        name: event.name,
      );
      emit(SignupSuccessState(name: event.name));
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(SignupFailed(
            errorMessage: IssueService.getMessagesFromFirebaseCode(e.code)));
      }
    }
  }
}
