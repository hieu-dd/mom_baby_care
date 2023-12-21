part of 'app_bloc.dart';

enum AppStatus { unauthorized, authorized }

class AppState extends Equatable {
  const AppState._({required this.status, required this.user});

  final AppStatus status;
  final User user;

  const AppState.unauthorized()
      : this._(status: AppStatus.unauthorized, user: User.empty);

  const AppState.authorized(User user)
      : this._(status: AppStatus.authorized, user: user);

  bool isAuthorized() => status == AppStatus.authorized;

  @override
  List<Object> get props => [status, user];
}
