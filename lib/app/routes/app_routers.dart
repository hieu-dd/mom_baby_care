import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mom_baby_care/app/bloc/app_bloc.dart';
import 'package:mom_baby_care/app/routes/routes.dart';
import 'package:mom_baby_care/baby/baby.dart';
import 'package:mom_baby_care/baby_info/baby_info.dart';
import 'package:mom_baby_care/baby_size/baby_size.dart';
import 'package:mom_baby_care/create_baby/create_baby.dart';
import 'package:mom_baby_care/login/login.dart';
import 'package:mom_baby_care/wonder_week/wonder_week.dart';

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
          path: RouterDestination.babySize.path,
          builder: (BuildContext context, GoRouterState state) {
            return const BabySizePage();
          },
        ),
        GoRoute(
          path: RouterDestination.babyInfo.path,
          builder: (BuildContext context, GoRouterState state) {
            return const BabyInfoPage();
          },
        ),
        GoRoute(
            path: RouterDestination.wonderWeek.path,
            builder: (context, state) {
              return const WonderWeekPage();
            })
      ],
    ),
  ],
);
