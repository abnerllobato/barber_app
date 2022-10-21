part of 'cadastro_bloc.dart';

abstract class CadastroState {}

class CadastroInitial extends CadastroState {}

class CadastroLoading extends CadastroState {}

class CadastroSuccessState extends CadastroState {
  final String? name;
  CadastroSuccessState({this.name});
}

class CadastroFailed extends CadastroState {
  final String errorMessage;

  CadastroFailed(
      {this.errorMessage = 'Ops Algo de errado aconteceu, tente novamene !!'});
}
