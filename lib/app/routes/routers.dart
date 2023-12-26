import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mom_baby_care/app/bloc/app_bloc.dart';
import 'package:mom_baby_care/baby/baby.dart';
import 'package:mom_baby_care/baby_size/baby_size.dart';
import 'package:mom_baby_care/create_baby/create_baby.dart';
import 'package:mom_baby_care/login/login.dart';

GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          return state.isUnAuthorized()
              ? const LoginPage()
              : state.hasBaby()
                  ? const BabyPage()
                  : const CreateBabyPage();
        });
      },
      routes: <RouteBase>[
        GoRoute(
          path: BabySizePage.route,
          builder: (BuildContext context, GoRouterState state) {
            return const BabySizePage();
          },
        ),
      ],
    ),
  ],
);
