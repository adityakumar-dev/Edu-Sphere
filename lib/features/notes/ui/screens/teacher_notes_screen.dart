import 'package:edusphere_mobile/features/notes/ui/widgets/notes_screen_placeholder.dart';
import 'package:edusphere_mobile/features/notes/ui/widgets/teacher_notes_screen_appbar.dart';
import 'package:flutter/material.dart';

class TeacherNotesScreen extends StatelessWidget {
  const TeacherNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TeacherNotesScreenAppbar(),
      body: NotesScreenPlaceholder(),
    );
  }
}
