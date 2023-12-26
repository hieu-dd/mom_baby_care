import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:baby_repository/baby_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthenticationRepository authenticationRepository,
    required BabyRepository babyRepository,
  })  : _authenticationRepository = authenticationRepository,
        _babyRepository = babyRepository,
        super(AppState.unauthorized()) {
    _authenticationRepository.user.listen((user) {
      add(_AppUserChanged(user));
    });
    _babyRepository.streamBaby().listen((baby) {
      add(_AppBabyChanged(baby));
    });
    on<AppLogoutRequested>(_onLogoutRequested);
    on<_AppUserChanged>(_onUserChanged);
    on<_AppBabyChanged>(_onBabyChanged);
  }

  final AuthenticationRepository _authenticationRepository;
  final BabyRepository _babyRepository;

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logout());
  }

  Future<void> _onUserChanged(
      _AppUserChanged event, Emitter<AppState> emit) async {
    if (event.user.isNotEmpty) {
      final baby = await _babyRepository.getBaby();
      emit(AppState.authorized(user: event.user, baby: baby));
    } else {
      emit(AppState.unauthorized());
    }
  }

  void _onBabyChanged(_AppBabyChanged event, Emitter<AppState> emit) {
    emit(state.copyWith(baby: event.baby));
  }
}
