import 'package:edusphere_mobile/features/assignment/ui/widgets/assignment_page_placeholder.dart';
import 'package:edusphere_mobile/features/assignment/ui/widgets/student_assignment_screen_appbar.dart';
import 'package:flutter/material.dart';

class StudentAssignmentScreen extends StatelessWidget {
  const StudentAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: StudentAssignmentScreenAppbar(),
      body: AssignmentPagePlaceholder(),
    );
  }
}
