import 'package:edusphere_mobile/features/assignment/ui/widgets/assignment_page_placeholder.dart';
import 'package:edusphere_mobile/features/assignment/ui/widgets/teacher_assignment_screen_appbar.dart';
import 'package:flutter/material.dart';

class TeacherAssignmentScreen extends StatelessWidget {
  const TeacherAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TeacherAssignmentScreenAppbar(),
      body: AssignmentPagePlaceholder(),
    );
  }
}