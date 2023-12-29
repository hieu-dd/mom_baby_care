import 'package:baby_repository/baby_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_baby_care/baby_info/cubit/baby_info_cubit.dart';
import 'package:mom_baby_care/baby_info/cubit/baby_info_state.dart';
import 'package:mom_baby_care/common/view/baby_logo.dart';
import 'package:mom_baby_care/common/view/border.dart';

part 'baby_info_name.dart';

class BabyInfoPage extends StatelessWidget {
  const BabyInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final babyRepository = context.read<BabyRepository>();
    return BlocProvider(
      create: (_) => BabyInfoCubit(babyRepository: babyRepository),
      child: const _BabyInfoPage(),
    );
  }
}

class _BabyInfoPage extends StatelessWidget {
  const _BabyInfoPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              BabyLogo(),
              SizedBox(height: 30),
              _BabyInfoName(),
            ],
          ),
        ),
      ),
    );
  }
}
