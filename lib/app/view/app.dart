import 'package:authentication_repository/authentication_repository.dart';
import 'package:baby_repository/baby_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_baby_care/app/bloc/app_bloc.dart';
import 'package:mom_baby_care/app/routes/routers.dart';

class App extends StatelessWidget {
  const App(
      {super.key,
      required AuthenticationRepository authenticationRepository,
      required BabyRepository babyRepository})
      : _authenticationRepository = authenticationRepository,
        _babyRepository = babyRepository;

  final AuthenticationRepository _authenticationRepository;
  final BabyRepository _babyRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<BabyRepository>(create: (_) => _babyRepository),
          RepositoryProvider<AuthenticationRepository>(
              create: (_) => _authenticationRepository),
        ],
        child: AppView(
          repository: _authenticationRepository,
        ));
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key, required AuthenticationRepository repository})
      : _authenticationRepository = repository;
  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AppBloc(repository: _authenticationRepository),
      child: Builder(builder: (BuildContext context) {
        return MaterialApp.router(
          routerConfig: appRouter,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
            ),
          ),
        );
      }),
    );
  }
}