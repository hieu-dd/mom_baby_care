part of 'login_cubit.dart';

enum LoginStatus { initial, inProgress, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.email = "",
    this.password = "",
    this.isValid = false,
    this.status = LoginStatus.initial,
  });

  final String email;
  final String password;
  final bool isValid;
  final LoginStatus status;

  LoginState copyWith({
    String? newEmail,
    String? newPassword,
    bool? newIsValid,
    LoginStatus? newStatus,
  }) =>
      LoginState(
        email: newEmail ?? email,
        password: newPassword ?? password,
        isValid: newIsValid ?? isValid,
        status: newStatus ?? status,
      );

  @override
  List<Object> get props => [email, password, isValid, status];
}
