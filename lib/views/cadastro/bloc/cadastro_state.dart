part of 'cadastro_bloc.dart';

abstract class CadastroState {}

class CadastroInitial extends CadastroState {}

class CadastroLoading extends CadastroState {}

class CadastroSuccessState extends CadastroState {
  final String? email;
  final String? password;
  CadastroSuccessState(this.email, this.password);
}

class CadastroFailed extends CadastroState {
  final String errorMessage;

  CadastroFailed({required this.errorMessage});
}
