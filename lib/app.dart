import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_baby_care/login/view/login_page.dart';

class App extends StatelessWidget {
  const App(
      {super.key, required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final stream = context.read<AuthenticationRepository>().user;
    return MaterialApp(
      home: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            return snapshot.data?.isNotEmpty == true
                ? Text("Home")
                : LoginPage();
          }),
    );
  }
}
