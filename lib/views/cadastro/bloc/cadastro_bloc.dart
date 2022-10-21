import 'package:barbearia_app/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
          dataCriacao: '15/10/2022',
          dataModificacao: '16/10/2022',
          nivel: 'cliente');
      // ignore: invalid_use_of_visible_for_testing_member
      emit(CadastroSuccessState(name: event.name));
    } catch (e) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(CadastroFailed(errorMessage: e.toString()));
    }

    // throw Exception('algo de errado não esta certo!');
  }
}
