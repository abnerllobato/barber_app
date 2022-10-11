part of 'login_page_bloc.dart';

enum LoginStatus { authenticated, unauthenticated, loading, success, failure }

class LoginPageState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status1;
  final String? errorMessage;
  final LoginStatus status;

  const LoginPageState._(
      {required this.status,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.status1 = FormzStatus.pure,
      this.errorMessage});

  const LoginPageState.authenticated()
      : this._(
          status: LoginStatus.authenticated,
        );

  const LoginPageState.unauthenticated()
      : this._(
          status: LoginStatus.unauthenticated,
        );

  const LoginPageState.loading()
      : this._(
          status: LoginStatus.loading,
        );

  const LoginPageState.success()
      : this._(
          status: LoginStatus.success,
        );

  @override
  List<Object?> get props => [status, email, password, status1, errorMessage];
}
