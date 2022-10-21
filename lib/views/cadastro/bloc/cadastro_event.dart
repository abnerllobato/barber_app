part of 'cadastro_bloc.dart';

abstract class CadastroEvent extends Equatable {
  const CadastroEvent();

  @override
  List<Object?> get props => [];
}

class LoadCadastroEvent extends CadastroEvent {}

class CadastroButtonEvent extends CadastroEvent {
  final String name;
  final String email;
  final String password;

  const CadastroButtonEvent(
      {required this.name, required this.email, required this.password});

  @override
  List<Object?> get props => [email, password, name];
}
