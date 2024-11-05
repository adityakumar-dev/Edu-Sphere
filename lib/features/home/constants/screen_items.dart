import 'package:edusphere_mobile/features/assignment/ui/screens/student_assignment_screen.dart';
import 'package:edusphere_mobile/features/assignment/ui/screens/teacher_assignment_screen.dart';
import 'package:edusphere_mobile/features/notes/ui/screens/student_notes_screen.dart';
import 'package:edusphere_mobile/features/notes/ui/screens/teacher_notes_screen.dart';
import 'package:edusphere_mobile/features/settings/ui/screens/student_settings_screen.dart';
import 'package:edusphere_mobile/features/settings/ui/screens/teacher_settings_screen.dart';
import 'package:flutter/material.dart';

class ScreenItems {
  List<StatelessWidget> teacher = const [
    TeacherAssignmentScreen(),
    TeacherNotesScreen(),
    TeacherSettingsScreen(),
  ];
  List<StatelessWidget> student = const [
    StudentAssignmentScreen(),
    StudentNotesScreen(),
    StudentSettingsScreen(),
  ];
}
