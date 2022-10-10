part of 'login_page_bloc.dart';

abstract class LoginPageEvent extends Equatable {
  const LoginPageEvent();

  @override
  List<Object> get props => [];
}

class LoginPageLogoutRequested extends LoginPageEvent {}

class LoginPageUserChanged extends LoginPageEvent {
  final User user;

  const LoginPageUserChanged(this.user);

  @override
  List<Object> get props => [user];
}
