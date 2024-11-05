import 'package:edusphere_mobile/features/login/ui/canvas/student_login_canvas.dart';
import 'package:edusphere_mobile/features/login/ui/canvas/teacher_login_canvas.dart';
import 'package:flutter/material.dart';

class LoginOptionButtons extends StatelessWidget {
  const LoginOptionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 20,
      children: [TeacherLoginButton(), StudentLoginButton()],
    );
  }
}

class TeacherLoginButton extends StatelessWidget {
  const TeacherLoginButton({super.key});

  void _showTeacherLoginCanvas(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const TeacherLoginCanvas(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () => _showTeacherLoginCanvas(context),
      icon: const Icon(Icons.school_outlined),
      label: const Text("Teacher"),
    );
  }
}

class StudentLoginButton extends StatelessWidget {
  const StudentLoginButton({super.key});

  void _showStudentLoginCanvas(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const StudentLoginCanvas(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () => _showStudentLoginCanvas(context),
      icon: const Icon(Icons.import_contacts_outlined),
      label: const Text("Student"),
    );
  }
}
