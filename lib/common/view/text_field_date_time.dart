import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldDateTime extends StatefulWidget {
  const TextFieldDateTime({
    required this.selectDate,
    required this.label,
    super.key,
  });

  final Function selectDate;
  final String label;

  @override
  State<TextFieldDateTime> createState() => _TextFieldDateTimeState();
}

class _TextFieldDateTimeState extends State<TextFieldDateTime> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        _controller.text = formattedDate;
        widget.selectDate(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      readOnly: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        label: Text(widget.label),
      ),
      onTap: () {
        _selectDate(context);
      },
    );
  }
}
