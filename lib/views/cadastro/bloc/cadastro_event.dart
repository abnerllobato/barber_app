part of 'cadastro_bloc.dart';

@immutable
abstract class CadastroEvent {}

class LoadCadastroEvent extends CadastroEvent {}

class OnButtonPressedCadastroEvent extends CadastroEvent {
  final Cadastro dados;
  OnButtonPressedCadastroEvent(this.dados);
}

class CadastroBarbeiro extends CadastroEvent {
  final Cadastro barbeiro;

  CadastroBarbeiro(this.barbeiro, {required List<Cadastro> barbeiros});
}
