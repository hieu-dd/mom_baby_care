part of 'baby_info_page.dart';

class _BabyInfoGender extends StatelessWidget {
  const _BabyInfoGender({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabyInfoCubit, BabyInfoState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return TextFieldGender(
          label: 'Giới tính',
          selected: state.gender.name,
          select: (gender) {
            context.read<BabyInfoCubit>().changeGender(gender);
          },
          dropdownOptions: Gender.values.map((e) => e.name).toList(),
        );
      },
    );
  }
}
