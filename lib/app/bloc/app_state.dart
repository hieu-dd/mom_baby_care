part of 'app_bloc.dart';

enum AppStatus { unauthorized, authorized }

class AppState extends Equatable {
  const AppState({
    required this.status,
    required this.user,
    required this.baby,
  });

  const AppState._({
    required this.status,
    required this.user,
    required this.baby,
  });

  final AppStatus status;
  final User user;
  final Baby baby;

  AppState.unauthorized()
      : this._(
          status: AppStatus.unauthorized,
          user: User.empty,
          baby: Baby.empty,
        );

  AppState.authorized({required User user, Baby? baby})
      : this._(
          status: AppStatus.authorized,
          user: user,
          baby: baby ?? Baby.empty,
        );

  AppState copyWith({Baby? baby}) => AppState(
        status: status,
        user: user,
        baby: baby ?? this.baby,
      );

  bool isAuthorized() => status == AppStatus.authorized;

  bool isUnAuthorized() => status == AppStatus.unauthorized;

  bool hasBaby() => !baby.isEmpty;

  @override
  List<Object> get props => [status, user, baby];
}
