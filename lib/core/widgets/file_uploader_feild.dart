import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';

class FileUploaderFeild extends StatelessWidget {
  const FileUploaderFeild({
    super.key,
    required this.controller,
    required this.onPressed,
    this.labelText,
    this.validator,
  });

  final TextEditingController controller;
  final String? labelText;
  final void Function()? onPressed;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextEntry(
        readOnly: true,
        labelText: labelText,
        controller: controller,
        validator: validator,
        suffixIcon: FileUploaderButton(onPressed: onPressed),
      ),
    );
  }
}

class FileUploaderButton extends StatelessWidget {
  const FileUploaderButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.upload),
    );
  }
}
