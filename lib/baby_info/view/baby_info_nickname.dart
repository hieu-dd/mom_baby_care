part of 'baby_info_page.dart';

class _BabyInfoNickName extends StatefulWidget {
  const _BabyInfoNickName({super.key});

  @override
  State<_BabyInfoNickName> createState() => _BabyInfoNickNameState();
}

class _BabyInfoNickNameState extends State<_BabyInfoNickName> {
  final TextEditingController _editingController = TextEditingController();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BabyInfoCubit, BabyInfoState>(
      listenWhen: (previous, current) => previous.nickname != current.nickname,
      listener: (context, state) {
        _editingController.text = state.nickname ?? '';
      },
      buildWhen: (previous, current) => previous.nickname != current.nickname,
      builder: (context, state) {
        return TextField(
          controller: _editingController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: AppBorderRadius.medium,
            ),
            label: Text("Biệt danh"),
          ),
          onChanged: (text) {
            context.read<BabyInfoCubit>().changeNickname(text);
          },
        );
      },
    );
  }
}
