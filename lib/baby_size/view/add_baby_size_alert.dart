part of 'baby_size_page.dart';

void _showInputPopup(BuildContext context) async {
  showDialog<Map<String, double>>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Nhập thông tin con yêu'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                key: const Key('add_size_height'),
                decoration: const InputDecoration(labelText: 'Chiều cao (cm)'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  context
                      .read<BabySizeCubit>()
                      .changeHeight(double.tryParse(value));
                },
              ),
              TextField(
                key: const Key('add_size_weight'),
                decoration: InputDecoration(labelText: 'Cân nặng (kg)'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  context
                      .read<BabySizeCubit>()
                      .changeWeight(double.tryParse(value));
                },
              ),
              TextField(
                key: const Key('add_size_head'),
                decoration: InputDecoration(labelText: 'Vòng đầu (cm)'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  context
                      .read<BabySizeCubit>()
                      .changeHeadSize(double.tryParse(value));
                },
              ),
              TextFieldDateTime(
                selectDate: (date) {
                  context.read<BabySizeCubit>().changeDateTime(date);
                },
                label: 'Ngày tháng',
                inputBorder: const UnderlineInputBorder(),
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Bỏ qua'),
          ),
          const _ConfirmAddSizeButton(),
        ],
      );
    },
  );
}

class _ConfirmAddSizeButton extends StatelessWidget {
  const _ConfirmAddSizeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BabySizeCubit, BabySizeState>(builder: (context, state) {
      return TextButton(
        onPressed: state.isValid()
            ? () async {
                await context.read<BabySizeCubit>().saveSize();
                Navigator.of(context).pop();
              }
            : null,
        child: const Text('Lưu'),
      );
    });
  }
}
