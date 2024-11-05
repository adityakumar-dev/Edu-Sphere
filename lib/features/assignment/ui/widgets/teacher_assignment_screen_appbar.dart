import 'package:edusphere_mobile/shared/widgets/top_appbar.dart';
import 'package:flutter/material.dart';

class TeacherAssignmentScreenAppbar extends StatelessWidget implements PreferredSizeWidget{
  const TeacherAssignmentScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TopAppbar(title: Text("\t Assignments"));
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// TO DO: Filter Button