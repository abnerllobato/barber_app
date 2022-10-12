part of 'login_page_bloc.dart';

enum LoginStatus { authenticated, unauthenticated, loading, success, failure }

class LoginPageState extends Equatable {
  final String? errorMessage;
  final LoginStatus status;

  const LoginPageState._({required this.status, this.errorMessage});

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
  List<Object?> get props => [status, errorMessage];
}
