import 'package:edusphere_mobile/features/notes/ui/canvas/notes_uploader_canvas.dart';
import 'package:edusphere_mobile/shared/widgets/top_appbar.dart';
import 'package:flutter/material.dart';

class TeacherNotesScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const TeacherNotesScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TopAppbar(
      title: Text("\t Subject Notes"),
      actions: [UploadSubjectNotesButton()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class UploadSubjectNotesButton extends StatelessWidget {
  const UploadSubjectNotesButton({super.key});

  void _showNotesUploaderCanvas(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const NotesUploaderCanvas(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showNotesUploaderCanvas(context),
      icon: const Icon(Icons.add),
    );
  }
}
