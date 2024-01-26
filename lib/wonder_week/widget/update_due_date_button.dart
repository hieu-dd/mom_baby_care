part of '../view/wonder_week_page.dart';

class _UpdateDueDateAction extends StatefulWidget {
  const _UpdateDueDateAction({required this.selectDate, super.key});

  final Function selectDate;

  @override
  State<_UpdateDueDateAction> createState() => _UpdateDueDateActionState();
}

class _UpdateDueDateActionState extends State<_UpdateDueDateAction> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      widget.selectDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          _selectDate(context);
        },
        icon: const Icon(Icons.settings));
  }
}
