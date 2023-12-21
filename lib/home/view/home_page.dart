import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_baby_care/app/bloc/app_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: InkWell(
          child: Text("Home"),
          onTap: () {
            appBloc.add(const AppLogoutRequested());
          },
        ),
      ),
    );
  }
}
