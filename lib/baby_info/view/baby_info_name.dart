part of 'baby_info_page.dart';

class _BabyInfoName extends StatefulWidget {
  const _BabyInfoName({super.key});

  @override
  State<_BabyInfoName> createState() => _BabyInfoNameState();
}

class _BabyInfoNameState extends State<_BabyInfoName> {
  final TextEditingController _editingController = TextEditingController();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BabyInfoCubit, BabyInfoState>(
      listenWhen: (previous, current) =>
          previous.name != current.name &&
          current.name != _editingController.text,
      listener: (context, state) {
        _editingController.text = state.name;
      },
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          controller: _editingController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: AppBorderRadius.medium,
            ),
            label: Text("Tên"),
          ),
          onChanged: (text) {
            context.read<BabyInfoCubit>().changeName(text);
          },
        );
      },
    );
  }
}
