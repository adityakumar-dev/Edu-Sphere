import 'package:edusphere_mobile/shared/widgets/top_appbar.dart';
import 'package:flutter/material.dart';

class StudentNotesScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const StudentNotesScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TopAppbar(title: Text("\t Subject Notes"));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// TO DO: Filter Button