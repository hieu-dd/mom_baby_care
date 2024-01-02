import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'border.dart';

class TextFieldDateTime extends StatefulWidget {
  const TextFieldDateTime({
    required this.selectDate,
    required this.label,
    InputBorder? inputBorder,
    DateTime? initialDate,
    super.key,
  })  : _border = inputBorder,
        _initialDate = initialDate;

  final Function selectDate;
  final String label;
  final InputBorder? _border;
  final DateTime? _initialDate;

  @override
  State<TextFieldDateTime> createState() => _TextFieldDateTimeState();
}

class _TextFieldDateTimeState extends State<TextFieldDateTime> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void didUpdateWidget(covariant TextFieldDateTime oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._initialDate != widget._initialDate) {
      _controller.text =
          widget._initialDate != null ? _formatTime(widget._initialDate!) : '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _controller.text = _formatTime(picked);
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
        border: widget._border ??
            const OutlineInputBorder(
              borderRadius: AppBorderRadius.medium,
            ),
        label: Text(widget.label),
      ),
      onTap: () {
        _selectDate(context);
      },
    );
  }

  String _formatTime(DateTime time) {
    return DateFormat('yyyy-MM-dd').format(time);
  }
}
