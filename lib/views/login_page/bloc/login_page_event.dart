part of 'login_page_bloc.dart';

abstract class LoginPageEvent extends Equatable {
  const LoginPageEvent();

  @override
  List<Object> get props => [];
}

class LoginPageLogoutRequested extends LoginPageEvent {}

//class LoginPageUserChanged extends LoginPageEvent {
//  final User user;
//
//  const LoginPageUserChanged(this.user);
//
//  @override
//  List<Object> get props => [user];
//}

class LoginButtonPressed extends LoginPageEvent {
  final String email;
  final String password;

  const LoginButtonPressed({required this.email, required this.password});

  @override
  List<Object> get props => [this.email, this.password];
}
