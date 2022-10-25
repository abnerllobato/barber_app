part of 'signup_bloc.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccessState extends SignupState {
  final String? name;
  SignupSuccessState({this.name});
}

class SignupFailed extends SignupState {
  final String errorMessage;

  SignupFailed(
      {this.errorMessage = 'Ops Algo de errado aconteceu, tente novamente !!'});
}
