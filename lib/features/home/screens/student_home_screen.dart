import 'package:edusphere_mobile/features/home/constants/screen_items.dart';
import 'package:edusphere_mobile/features/home/widgets/home_screen_navigation_bar.dart';
import 'package:flutter/material.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
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
        children: ScreenItems().student,
      ),
    );
  }
}
