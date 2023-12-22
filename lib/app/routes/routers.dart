import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mom_baby_care/app/bloc/app_bloc.dart';
import 'package:mom_baby_care/home/home.dart';
import 'package:mom_baby_care/login/login.dart';

GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        final appBloc = context.watch<AppBloc>();
        return appBloc.state.isAuthorized()
            ? const HomePage()
            : const LoginPage();
      },
    ),
  ],
);
