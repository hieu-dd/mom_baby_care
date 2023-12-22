part of 'login_cubit.dart';

enum LoginStatus { initial, inProgress, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.email = "",
    this.password = "",
    this.isValid = false,
    this.status = LoginStatus.initial,
    this.errorMessage,
  });

  final String email;
  final String password;
  final bool isValid;
  final LoginStatus status;
  final String? errorMessage;

  LoginState copyWith({
    String? newEmail,
    String? newPassword,
    bool? newIsValid,
    LoginStatus? newStatus,
    String? newErrorMessage,
  }) =>
      LoginState(
        email: newEmail ?? email,
        password: newPassword ?? password,
        isValid: newIsValid ?? isValid,
        status: newStatus ?? status,
        errorMessage: newErrorMessage ?? errorMessage,
      );

  @override
  List<Object> get props => [email, password, isValid, status];
}
