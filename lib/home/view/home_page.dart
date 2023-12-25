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
            _BabyView(),
            InkWell(
              child: Text("Home"),
              onTap: () {
                appBloc.add(const AppLogoutRequested());
              },
            ),
            InkWell(
              child: Text("Save Baby"),
              onTap: () {
                context
                    .read<BabyRepository>()
                    .saveBaby(Baby(name: "name", birthDay: DateTime.now()));
              },
            ),
            InkWell(
              child: Text("Update Baby"),
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
              ? Text("Null")
              : snapshot.requireData.name.isEmpty
                  ? Text("Empty")
                  : Text(snapshot.requireData.name);
        });
  }
}
