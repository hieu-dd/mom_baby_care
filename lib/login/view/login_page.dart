import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_baby_care/login/cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          LoginCubit(repository: context.read<AuthenticationRepository>()),
      child: const LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      final readCubit = context.read<LoginCubit>();
      return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: ClipOval(
                child: Image.asset("assets/images/mom_baby_care_logo.jpeg"),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            TextField(
              onChanged: (text) {
                readCubit.changeEmail(text);
              },
            ),
            TextField(
              onChanged: (text) {
                readCubit.changePassword(text);
              },
            ),
            ElevatedButton(
                onPressed: state.isValid
                    ? () {
                        readCubit.logInWithCredentials();
                      }
                    : null,
                child: Text("Login")),
          ],
        ),
      );
    });
  }
}
