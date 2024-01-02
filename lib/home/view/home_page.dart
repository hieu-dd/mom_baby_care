import 'package:baby_repository/baby_repository.dart';
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
        child: Column(
          children: [
            const _BabyView(),
            InkWell(
              child: const Text("Home"),
              onTap: () {
                appBloc.add(const AppLogoutRequested());
              },
            ),
            InkWell(
              child: const Text("Save Baby"),
              onTap: () {
                context.read<BabyRepository>().saveBaby(
                    Baby(id: '', name: "name", birthday: DateTime.now()));
              },
            ),
            InkWell(
              child: const Text("Update Baby"),
              onTap: () {
                context.read<BabyRepository>().updateName('');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BabyView extends StatelessWidget {
  const _BabyView();

  @override
  Widget build(BuildContext context) {
    final babyRepository = context.read<BabyRepository>();

    return StreamBuilder(
        stream: babyRepository.streamBaby(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const Text("Null")
              : snapshot.requireData.name.isEmpty
                  ? const Text("Empty")
                  : Text(snapshot.requireData.name);
        });
  }
}
