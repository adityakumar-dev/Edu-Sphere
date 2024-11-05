import 'package:flutter/material.dart';

class AccountLogOutButton extends StatelessWidget {
  const AccountLogOutButton({super.key, this.onPressed});

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: FilledButton(
        onPressed: onPressed,
        style: _buttonStyle(),
        child: Text("Log Out", style: _labelStyle()),
      ),
    );
  }

  ButtonStyle _buttonStyle() => const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.redAccent),
      );

  TextStyle _labelStyle() => const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );
}
