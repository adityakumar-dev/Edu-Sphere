import 'package:flutter/material.dart';

enum ThemeOptions { system, dark, light }

class ThemeSelectorOptions extends StatefulWidget {
  const ThemeSelectorOptions({super.key});

  @override
  State<ThemeSelectorOptions> createState() => _ThemeSelectorOptionsState();
}

class _ThemeSelectorOptionsState extends State<ThemeSelectorOptions> {
  ThemeOptions? _selectedTheme = ThemeOptions.system;

  void _changeTheme(ThemeOptions? value) {
    return setState(() {
      _selectedTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioListTile<ThemeOptions>(
          value: ThemeOptions.system,
          groupValue: _selectedTheme,
          title: const Text("System"),
          onChanged: (value) => _changeTheme(value),
        ),
        RadioListTile<ThemeOptions>(
          value: ThemeOptions.light,
          groupValue: _selectedTheme,
          title: const Text("Light"),
          onChanged: (value) => _changeTheme(value),
        ),
        RadioListTile<ThemeOptions>(
          value: ThemeOptions.dark,
          groupValue: _selectedTheme,
          title: const Text("Dark"),
          onChanged: (value) => _changeTheme(value),
        ),
      ],
    );
  }
}
