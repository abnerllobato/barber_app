import 'package:barbearia_app/locator.dart';
import 'package:barbearia_app/repositories/auth_repository.dart';
import 'package:barbearia_app/repositories/auth_repository_firebase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:barbearia_app/services/issues_service.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  var _authRepository = serviceLocator.get<AuthRepository>();

  SignupBloc() : super(SignupInitial()) {
    _authRepository = FirebaseAuthRepository();
    on<SignupButtonEvent>((event, emit) => _onPressed(event));
  }

  Future<void> _onPressed(
    SignupButtonEvent event,
  ) async {
    emit(SignupLoading());
    try {
      await _authRepository.signup(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      emit(SignupSuccessState());
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(SignupFailed(
            errorMessage: IssueService.getMessagesFromFirebaseCode(e.code)));
      }
    }
  }
}
