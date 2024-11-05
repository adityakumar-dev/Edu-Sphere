import 'package:edusphere_mobile/core/widgets/canvas_banner.dart';
import 'package:edusphere_mobile/features/login/ui/widgets/student_login_form.dart';
import 'package:edusphere_mobile/features/registeration/ui/screens/student_registeration_screen.dart';
import 'package:flutter/material.dart';

class StudentLoginCanvas extends StatelessWidget {
  const StudentLoginCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StudentLoginBanner(),
          StudentLoginForm(),
          StudentRegisterationPrompt(),
        ],
      ),
    );
  }
}

class StudentLoginBanner extends StatelessWidget {
  const StudentLoginBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const CanvasBanner(
      icon: Icon(Icons.import_contacts, size: 45),
      headingText: "Student Login",
      subHeadingText: "Enter required details below.",
    );
  }
}

class StudentRegisterationPrompt extends StatelessWidget {
  const StudentRegisterationPrompt({super.key});

  void _openForm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const StudentRegisterationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("New Student?\t"),
        TextButton(
          onPressed: () => _openForm(context),
          child: Text("Register", style: _labelStyle()),
        ),
      ],
    );
  }

  TextStyle _labelStyle() {
    return const TextStyle(fontWeight: FontWeight.bold);
  }
}

