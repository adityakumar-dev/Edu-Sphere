import 'package:flutter/material.dart';

class TextEntry extends StatelessWidget {
  const TextEntry({
    super.key,
    this.enabled = true,
    this.obscureText = false,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.none,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.icon,
    this.preffixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  final String? labelText;
  final bool obscureText, enabled, readOnly;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final Widget? icon, preffixIcon, suffixIcon;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      validator: validator,
      decoration: _boxDecoration(),
    );
  }

  InputDecoration _boxDecoration() {
    return InputDecoration(
      enabled: enabled,
      labelText: labelText,
      prefixIcon: preffixIcon,
      suffixIcon: suffixIcon,
      icon: icon,
      filled: false,
      border: const OutlineInputBorder(),
    );
  }
}
