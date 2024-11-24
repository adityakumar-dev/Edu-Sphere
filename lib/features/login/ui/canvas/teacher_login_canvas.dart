import 'package:edusphere_mobile/core/widgets/canvas_banner.dart';
import 'package:edusphere_mobile/features/login/ui/widgets/teacher_login_form.dart';
import 'package:edusphere_mobile/features/registeration/ui/screens/teacher_registeration_screen.dart';
import 'package:flutter/material.dart';

class TeacherLoginCanvas extends StatelessWidget {
  const TeacherLoginCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TeacherLoginFormBanner(),
            TeacherLoginForm(),
            const TeacherRegisterationPrompt(),
          ],
        ),
      ),
    );
  }
}

class TeacherLoginFormBanner extends StatelessWidget {
  const TeacherLoginFormBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const CanvasBanner(
      icon: Icon(Icons.school, size: 45),
      headingText: "Teacher Login",
      subHeadingText: "Enter required details below.",
    );
  }
}

class TeacherRegisterationPrompt extends StatelessWidget {
  const TeacherRegisterationPrompt({super.key});

  void _openForm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TeacherRegisterationScreen(),
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
