import 'package:baby_repository/baby_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateBabyPage extends StatelessWidget {
  const CreateBabyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          InkWell(
            child: Text("Create baby"),
            onTap: () {
              context
                  .read<BabyRepository>()
                  .saveBaby(Baby(name: "name", birthDay: DateTime.now()));
            },
          ),
        ],
      ),
    );
  }
}
