import 'package:flutter/material.dart';

import 'border.dart';

class TextFieldGender extends StatefulWidget {
  const TextFieldGender({
    required this.select,
    required this.label,
    required this.dropdownOptions,
    this.selected,
    super.key,
  });

  final Function select;
  final String label;
  final List<String> dropdownOptions;
  final String? selected;

  @override
  State<TextFieldGender> createState() => _TextFieldGenderState();
}

class _TextFieldGenderState extends State<TextFieldGender> {
  final TextEditingController _dropdownValueController =
      TextEditingController();
  String? _selectedValue;

  @override
  void didUpdateWidget(covariant TextFieldGender oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected) {
      setState(() {
        _selectedValue = widget.selected;
      });
    }
  }

  @override
  void dispose() {
    _dropdownValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      icon: const Icon(Icons.arrow_drop_down),
      isExpanded: true,
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
        widget.select(newValue);
        _dropdownValueController.text = newValue ?? '';
      },
      items:
          widget.dropdownOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: AppBorderRadius.medium,
        ),
        label: Text(widget.label),
      ),
    );
  }
}
