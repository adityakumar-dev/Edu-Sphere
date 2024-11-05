import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';

class PasswordEntry extends StatefulWidget {
  const PasswordEntry({
    super.key,
    this.labelText,
    this.controller,
    this.enabled = true,
    this.icon,
    this.preffixIcon,
    this.onChanged,
    this.validator,
  });

  final String? labelText;
  final bool enabled;
  final TextEditingController? controller;
  final Widget? icon, preffixIcon;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  @override
  State<PasswordEntry> createState() => _PasswordEntryState();
}

class _PasswordEntryState extends State<PasswordEntry> {
  IconData _eyeSuffixIcon = Icons.remove_red_eye_outlined;
  bool _canHideText = true;

  @override
  Widget build(BuildContext context) {
    return TextEntry(
      labelText: widget.labelText,
      enabled: widget.enabled,
      icon: widget.icon,
      preffixIcon: widget.preffixIcon,
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: _canHideText,
      suffixIcon: _showSuffixIcon(),
    );
  }

  MaterialButton _showSuffixIcon() {
    return MaterialButton(
      minWidth: 5,
      onPressed: () => _onIconTap,
      shape: const CircleBorder(),
      child: Icon(_eyeSuffixIcon),
    );
  }

  Set<void> get _onIconTap {
    return {
      _canHideText
          ? setState(() {
              _canHideText = !_canHideText;
              _eyeSuffixIcon = Icons.remove_red_eye_rounded;
            })
          : setState(() {
              _canHideText = !_canHideText;
              _eyeSuffixIcon = Icons.remove_red_eye_outlined;
            })
    };
  }
}
