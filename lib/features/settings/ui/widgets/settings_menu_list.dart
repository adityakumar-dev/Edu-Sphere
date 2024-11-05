import 'package:edusphere_mobile/core/theme/theme_selector.dart';
import 'package:flutter/material.dart';

class SettingsMenuList extends StatelessWidget {
  const SettingsMenuList({
    super.key,
    required this.accountPage,
  });

  final Widget accountPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("\t General Settings", style: _headingStyle(context)),
        const ThemeEditorTile(),
        UserEditorTile(accountPage: accountPage),
        Text("\t About App", style: _headingStyle(context)),
        const AppUpdateTile(),
        const AppSourceCodeTile(),
      ],
    );
  }

  TextStyle _headingStyle(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xffaac7ff)
            : const Color(0xff415f91),
      );
}

class AppUpdateTile extends StatelessWidget {
  const AppUpdateTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Check For Update"),
      subtitle: const Text("Current Version: Testing"),
      leading: const Icon(Icons.update),
      onTap: () {},
    );
  }
}

class AppSourceCodeTile extends StatelessWidget {
  const AppSourceCodeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Source Code"),
      subtitle: const Text("See app source code"),
      leading: const Icon(Icons.code),
      onTap: () {},
    );
  }
}

class UserEditorTile extends StatelessWidget {
  const UserEditorTile({
    super.key,
    required this.accountPage,
  });

  final Widget accountPage;

  void _openAccountForm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => accountPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("User"),
      subtitle: const Text("View and edit user's settings"),
      leading: const Icon(Icons.person_outline),
      onTap: () => _openAccountForm(context),
    );
  }
}

class ThemeEditorTile extends StatelessWidget {
  const ThemeEditorTile({super.key});

  Future<dynamic> _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => const ThemeSelector(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Theme"),
      subtitle: const Text("Change app theme"),
      leading: const Icon(Icons.palette_outlined),
      onTap: () => _showDialog(context),
    );
  }
}
