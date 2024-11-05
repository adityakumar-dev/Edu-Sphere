import 'package:edusphere_mobile/features/account/ui/screens/student_account_screen.dart';
import 'package:edusphere_mobile/features/settings/ui/widgets/settings_menu_list.dart';
import 'package:edusphere_mobile/shared/widgets/top_appbar.dart';
import 'package:flutter/material.dart';

class StudentSettingsScreen extends StatelessWidget {
  const StudentSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingsScreenAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: SettingsMenuList(
          accountPage: StudentAccountScreen(),
        ),
      ),
    );
  }
}

class SettingsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SettingsScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TopAppbar(title: Text("\t Settings"));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
