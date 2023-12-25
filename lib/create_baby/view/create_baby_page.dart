import 'package:baby_repository/baby_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_baby_care/common/view/text_field_date_time.dart';
import 'package:mom_baby_care/common/view/text_field_gender.dart';
import 'package:mom_baby_care/consts/consts.dart';
import 'package:mom_baby_care/create_baby/cubit/create_baby_cubit.dart';
import 'package:mom_baby_care/create_baby/cubit/create_baby_state.dart';

class CreateBabyPage extends StatelessWidget {
  const CreateBabyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipOval(
                    child: Image.asset(AssetsImage.babyAvatar),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Baby',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 30),
                const _NameInput(),
                const SizedBox(height: 12),
                const _NickNameInput(),
                const SizedBox(height: 12),
                const _BirthdayInput(),
                const SizedBox(height: 12),
                const _GenderInput(),
                const SizedBox(height: 12),
                const _ConfirmButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBabyCubit, CreateBabState>(
        buildWhen: (previous, current) => previous.name != current.name,
        builder: (context, state) {
          return TextField(
            key: const Key('textfield_key_create_baby_name'),
            onChanged: (text) {
              context.read<CreateBabyCubit>().changeName(text);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              label: Text("Name"),
            ),
          );
        });
  }
}

class _NickNameInput extends StatelessWidget {
  const _NickNameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBabyCubit, CreateBabState>(
        buildWhen: (previous, current) => previous.nickname != current.nickname,
        builder: (context, state) {
          return TextField(
            key: const Key('textfield_key_create_baby_nickname'),
            onChanged: (text) {
              context.read<CreateBabyCubit>().changeNickname(text);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              label: Text("Nick name"),
            ),
          );
        });
  }
}

class _BirthdayInput extends StatelessWidget {
  const _BirthdayInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBabyCubit, CreateBabState>(
        buildWhen: (previous, current) => previous.birthday != current.birthday,
        builder: (context, state) {
          return TextFieldDateTime(
              label: 'Birth day',
              selectDate: (date) {
                context.read<CreateBabyCubit>().changeBirthday(date);
              });
        });
  }
}

class _GenderInput extends StatelessWidget {
  const _GenderInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBabyCubit, CreateBabState>(
        buildWhen: (previous, current) => previous.gender != current.gender,
        builder: (context, state) {
          return TextFieldGender(
            select: (gender) {
              context.read<CreateBabyCubit>().changeGender(gender);
            },
            label: 'Gender',
            dropdownOptions: Gender.values.map((e) => e.name).toList(),
          );
        });
  }
}

class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBabyCubit, CreateBabState>(
        builder: (context, state) {
      return SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: state.isValid
                ? () {
                    context.read<CreateBabyCubit>().createBaby();
                  }
                : null,
            child: Text('Confirm'),
          ));
    });
  }
}
