import 'package:edusphere_mobile/features/home/constants/screen_items.dart';
import 'package:edusphere_mobile/features/home/widgets/home_screen_navigation_bar.dart';
import 'package:flutter/material.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  var _selectedPage = 0;

  void onIconTap(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeScreenNavigationBar(
        selectedIndex: _selectedPage,
        onDestinationSelected: onIconTap,
      ),
      body: IndexedStack(
        index: _selectedPage,
        children: ScreenItems().teacher,
      ),
    );
  }
}
