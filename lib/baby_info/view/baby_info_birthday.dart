part of 'baby_info_page.dart';

class _BabyInfoBirthday extends StatelessWidget {
  const _BabyInfoBirthday({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabyInfoCubit, BabyInfoState>(
      buildWhen: (previous, current) => previous.birthday != current.birthday,
      builder: (context, state) {
        return TextFieldDateTime(
          label: 'Ngày sinh',
          initialDate: state.birthday,
          selectDate: (time) {
            context.read<BabyInfoCubit>().changeBirthday(time);
          },
        );
      },
    );
  }
}
