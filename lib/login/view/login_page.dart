import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: InkWell(
          child: Text("Login"),
          onTap: () {
            context.read<AuthenticationRepository>().loginWithUserAndPassword(
                email: 'doduchieu.kstn@gmail.com', password: '123456');
          },
        ),
      ),
    );
  }
}
