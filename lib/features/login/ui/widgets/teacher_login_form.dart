import 'package:edusphere_mobile/features/home/screens/teacher_home_screen.dart';
import 'package:edusphere_mobile/shared/widgets/password_entry.dart';
import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

class TeacherLoginForm extends StatelessWidget {
  const TeacherLoginForm({super.key});

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TeacherHomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TeacherLoginEmailEntry(controller: _email),
          TeacherLoginPasswordEntry(controller: _password),
          TeacherAccountLoginButton(
            onPressed: () => _navigateToHomeScreen(context),
          ),
        ],
      ),
    );
  }
}

class TeacherLoginEmailEntry extends StatelessWidget {
  const TeacherLoginEmailEntry({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextEntry(
        labelText: "Email",
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        validator: (value) => null,
      ),
    );
  }
}

class TeacherLoginPasswordEntry extends StatelessWidget {
  const TeacherLoginPasswordEntry({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: PasswordEntry(
        labelText: "Password",
        controller: controller,
        validator: (value) => null,
      ),
    );
  }
}

class TeacherAccountLoginButton extends StatelessWidget {
  const TeacherAccountLoginButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: FilledButton(
        onPressed: onPressed,
        child: Text("Login", style: _labelStyle()),
      ),
    );
  }

  TextStyle _labelStyle() => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
}
