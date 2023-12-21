import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginCubit({required AuthenticationRepository repository})
      : _authenticationRepository = repository,
        super(const LoginState());

  void changeEmail(String email) {
    emit(state.copyWith(
      newEmail: email,
      newIsValid: _validData(
        email,
        state.password,
      ),
    ));
  }

  void changePassword(String password) {
    emit(state.copyWith(
      newPassword: password,
      newIsValid: _validData(
        state.email,
        password,
      ),
    ));
  }

  Future<void> logInWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(newStatus: LoginStatus.inProgress));
    try {
      await _authenticationRepository.loginWithUserAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(newStatus: LoginStatus.success));
    } catch (_) {
      emit(state.copyWith(newStatus: LoginStatus.failure));
    }
  }

  bool _validData(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }
}
