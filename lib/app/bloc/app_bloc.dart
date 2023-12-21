import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository repository})
      : _authenticationRepository = repository,
        super(const AppState.unauthorized()) {
    _authenticationRepository.user.listen((user) {
      add(_AppUserChanged(user));
    });
    on<AppLogoutRequested>(_onLogoutRequested);
    on<_AppUserChanged>(_onUserChanged);
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logout());
  }

  void _onUserChanged(_AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty
        ? AppState.authorized(event.user)
        : const AppState.unauthorized());
  }

  final AuthenticationRepository _authenticationRepository;
}
