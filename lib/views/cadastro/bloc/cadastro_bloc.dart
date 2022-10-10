import 'package:barbearia_app/models/cadastro_model.dart';
import 'package:barbearia_app/repositories/barbeiros_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cadastro_event.dart';
part 'cadastro_state.dart';

class CadastroBloc extends Bloc<CadastroEvent, CadastroState> {
  final _cadastro = BarbeiroRepository();

  CadastroBloc() : super(CadastroInitial()) {
    on<OnButtonPressedCadastroEvent>((event, emit) => _onPressed(event.dados));
    //on<CadastroBarbeiro>(((event, emit) => emit(CadastroSuccessState(barbeiros: _cadastro.addClient(event.barbeiro)))));
  }

  Future<void> _onPressed(Cadastro cadastro) async {
    emit(CadastroLoading());
    try {
      await Future.delayed(Duration(seconds: 1));

      // ignore: invalid_use_of_visible_for_testing_member
      emit(CadastroSuccessState(
          cadastro.email, cadastro.name, cadastro.password));

      throw Exception('algo de errado não esta certo!');
    } catch (e) {
      emit(CadastroFailed());
      print(e);
    }
  }
}
