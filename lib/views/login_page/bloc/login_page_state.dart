part of 'login_page_bloc.dart';

enum LoginStatus { authenticated, unauthenticated }

class LoginPageState extends Equatable {
  final LoginStatus status;
  final User user;

  const LoginPageState._({
    required this.status,
    this.user = User.empty,
  });

  const LoginPageState.authenticated(User user)
      : this._(
          status: LoginStatus.authenticated,
          user: user,
        );

  const LoginPageState.unauthenticated()
      : this._(
          status: LoginStatus.unauthenticated,
        );

  @override
  List<Object?> get props => [status, user];
}
