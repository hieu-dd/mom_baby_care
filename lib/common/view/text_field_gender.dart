import 'package:flutter/material.dart';

class TextFieldGender extends StatefulWidget {
  const TextFieldGender({
    required this.select,
    required this.label,
    required this.dropdownOptions,
    super.key,
  });

  final Function select;
  final String label;
  final List<String> dropdownOptions;

  @override
  State<TextFieldGender> createState() => _TextFieldGenderState();
}

class _TextFieldGenderState extends State<TextFieldGender> {
  final TextEditingController _dropdownValueController =
      TextEditingController();
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      icon: const Icon(Icons.arrow_drop_down),
      isExpanded: true,
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
          widget.select(newValue);
          _dropdownValueController.text = newValue ?? '';
        });
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
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        label: Text(widget.label),
      ),
    );
  }

  @override
  void dispose() {
    _dropdownValueController.dispose();
    super.dispose();
  }
}
