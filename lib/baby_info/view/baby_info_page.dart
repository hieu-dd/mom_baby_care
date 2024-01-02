import 'package:baby_repository/baby_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_baby_care/baby_info/cubit/baby_info_cubit.dart';
import 'package:mom_baby_care/baby_info/cubit/baby_info_state.dart';
import 'package:mom_baby_care/common/view/baby_logo.dart';
import 'package:mom_baby_care/common/view/border.dart';
import 'package:mom_baby_care/common/view/text_field_date_time.dart';
import 'package:mom_baby_care/common/view/text_field_gender.dart';

part 'baby_info_birthday.dart';
part 'baby_info_gender.dart';
part 'baby_info_name.dart';
part 'baby_info_nickname.dart';

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
    return Scaffold(
      body: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              BabyLogo(),
              SizedBox(height: 30),
              _BabyInfoName(key: ValueKey('_baby_info_name')),
              SizedBox(height: 10),
              _BabyInfoNickName(key: ValueKey('_baby_info_nickname')),
              SizedBox(height: 10),
              _BabyInfoBirthday(key: ValueKey('_baby_info_birthday')),
              SizedBox(height: 10),
              _BabyInfoGender(key: ValueKey('_baby_info_gender'))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          context.read<BabyInfoCubit>().save();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
