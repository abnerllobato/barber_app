part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class LoadSignupEvent extends SignupEvent {}

class SignupButtonEvent extends SignupEvent {
  final String name;
  final String email;
  final String password;

  const SignupButtonEvent(
      {required this.name, required this.email, required this.password});

  @override
  List<Object?> get props => [email, password, name];
}