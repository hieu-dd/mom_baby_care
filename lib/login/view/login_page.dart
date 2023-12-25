import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_baby_care/common/view/border.dart';
import 'package:mom_baby_care/consts/consts.dart';
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
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Authentication Failure'),
            ),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ClipOval(
                    child: Image.asset(AssetsImage.logo),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const _EmailForm(),
                const SizedBox(
                  height: 12,
                ),
                const _PasswordForm(),
                const SizedBox(
                  height: 50,
                ),
                const _LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailForm extends StatelessWidget {
  const _EmailForm();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextField(
            onChanged: (text) {
              context.read<LoginCubit>().changeEmail(text);
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: AppBorderRadius.medium,
                ),
                label: const Text("Email"),
                errorText: state.email.isEmpty ? "Invalid email" : null),
          );
        });
  }
}

class _PasswordForm extends StatelessWidget {
  const _PasswordForm();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextField(
            onChanged: (text) {
              context.read<LoginCubit>().changePassword(text);
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: AppBorderRadius.medium,
                ),
                label: const Text("Password"),
                errorText: state.password.isEmpty ? "Invalid password" : null),
          );
        });
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.isValid != current.isValid,
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                onPressed: state.isValid
                    ? () {
                        context.read<LoginCubit>().logInWithCredentials();
                      }
                    : null,
                child: Text('Login'.toUpperCase())),
          );
        });
  }
}
