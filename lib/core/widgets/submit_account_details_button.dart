import 'package:flutter/material.dart';

class SubmitAccountDetailsButton extends StatelessWidget {
  const SubmitAccountDetailsButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text("Submit", style: _labelStyle()),
    );
  }

  TextStyle _labelStyle() => const TextStyle(fontWeight: FontWeight.bold);
}
