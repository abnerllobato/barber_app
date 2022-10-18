part of 'login_page_bloc.dart';

abstract class LoginPageEvent extends Equatable {
  const LoginPageEvent();

  @override
  List<Object> get props => [];
}

class LoginPageLogoutRequested extends LoginPageEvent {}

class LoginButtonPressed extends LoginPageEvent {
  final String email;
  final String password;

  const LoginButtonPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignOutButtonPressed extends LoginPageEvent {}

class SignInTextChangedEvent extends LoginPageEvent {
  final String emailValue;
  final String passwordValue;

  const SignInTextChangedEvent(this.emailValue, this.passwordValue);

  @override
  List<Object> get props => [emailValue, passwordValue];
}
