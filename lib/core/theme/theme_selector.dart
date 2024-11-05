import 'package:edusphere_mobile/core/theme/theme_selector_options.dart';
import 'package:flutter/material.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  void _closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Icons.palette_outlined),
      title: const Text("App Theme"),
      contentPadding: const EdgeInsets.all(0),
      content: const ThemeSelectorOptions(),
      actions: [
        TextButton(
          child: Text("Cancel", style: _labelStyle()),
          onPressed: () => _closeDialog(context),
        ),
      ],
    );
  }

  TextStyle _labelStyle() => const TextStyle(fontWeight: FontWeight.bold);
}
