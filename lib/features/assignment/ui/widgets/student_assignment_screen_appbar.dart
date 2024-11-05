import 'package:edusphere_mobile/features/assignment/ui/canvas/assignement_uploader_canvas.dart';
import 'package:edusphere_mobile/shared/widgets/top_appbar.dart';
import 'package:flutter/material.dart';

class StudentAssignmentScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const StudentAssignmentScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TopAppbar(
      title: Text("\t Assignments"),
      actions: [AssignementUploaderButton()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AssignementUploaderButton extends StatelessWidget {
  const AssignementUploaderButton({super.key});

  void _showAssignementUploaderCanvas(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const AssignementUploaderCanvas(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showAssignementUploaderCanvas(context),
      icon: const Icon(Icons.add),
    );
  }
}
