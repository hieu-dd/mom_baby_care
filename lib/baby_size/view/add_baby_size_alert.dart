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
                decoration: InputDecoration(labelText: 'Cân nặng (kg)'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {
                  context
                      .read<BabySizeCubit>()
                      .changeWeight(double.tryParse(value));
                },
              ),
              TextField(
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
            child: Text('Bỏ qua'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Builder(builder: (context) {
            final cubit = context.watch<BabySizeCubit>();
            return TextButton(
              child: Text('Lưu'),
              onPressed: cubit.state.isValid()
                  ? () async {
                      await context.read<BabySizeCubit>().saveSize();
                      Navigator.of(context).pop();
                    }
                  : null,
            );
          }),
        ],
      );
    },
  );
}
