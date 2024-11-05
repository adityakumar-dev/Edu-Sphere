import 'package:edusphere_mobile/features/notes/ui/widgets/notes_screen_placeholder.dart';
import 'package:edusphere_mobile/features/notes/ui/widgets/student_notes_screen_appbar.dart';
import 'package:flutter/material.dart';

class StudentNotesScreen extends StatelessWidget {
  const StudentNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: StudentNotesScreenAppbar(),
      body: NotesScreenPlaceholder(),
    );
  }
}