import 'package:edusphere_mobile/features/home/screens/student_home_screen.dart';
import 'package:edusphere_mobile/features/home/screens/teacher_home_screen.dart';
import 'package:edusphere_mobile/features/login/ui/canvas/student_login_canvas.dart';
import 'package:edusphere_mobile/features/login/ui/canvas/teacher_login_canvas.dart';
import 'package:edusphere_mobile/shared/Constants/app_constants.dart';
import 'package:edusphere_mobile/shared/Models/student_model.dart';
import 'package:edusphere_mobile/shared/Models/teacher_model.dart';
import 'package:edusphere_mobile/shared/Storage/app_local_data.dart';
import 'package:edusphere_mobile/shared/providers/Auth/student_auth_provider.dart';
import 'package:edusphere_mobile/shared/providers/Auth/teacher_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginOptionButtons extends StatefulWidget {
  const LoginOptionButtons({super.key});

  @override
  State<LoginOptionButtons> createState() => _LoginOptionButtonsState();
}

class _LoginOptionButtonsState extends State<LoginOptionButtons> {
  @override
  void initState() {
    super.initState();
    checkUserStatus(context);
  }

  void checkUserStatus(BuildContext context) async {
    // if (await AppLocalData.getAuthState(AppConstants.activeUser)) {
    final studentData = await AppLocalData.getStudentModel();
    final teacherData = await AppLocalData.getTeacherModel();
    print(teacherData);
    if (studentData != null) {
      Provider.of<StudentAuthProvider>(context, listen: false).init(
        studentData,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StudentHomeScreen(),
          ));
    } else if (teacherData != null) {
      Provider.of<TeacherAuthProvider>(context, listen: false)
          .init(teacherData);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TeacherHomeScreen(),
          ));
    }
    // }
  }

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
