import 'package:flutter/material.dart';

class DropdownFeild extends StatelessWidget {
  const DropdownFeild({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.labelText,
    this.validator,
    this.icon,
  });

  final String? labelText;
  final Widget? icon;
  final dynamic value;
  final List<DropdownMenuItem<Object>> items;
  final void Function(Object? value)? onChanged;
  final String? Function(Object? value)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items,
      value: value,
      onChanged: onChanged,
      validator: validator,
      icon: icon,
      decoration: _boxDecoration(),
    );
  }

  InputDecoration _boxDecoration() {
    return InputDecoration(
      border: const OutlineInputBorder(),
      labelText: labelText,
    );
  }
}
