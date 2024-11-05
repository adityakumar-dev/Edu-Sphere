import 'package:flutter/material.dart';

class HomeScreenNavigationBar extends StatelessWidget {
  const HomeScreenNavigationBar({
    super.key,
    this.onDestinationSelected,
    required this.selectedIndex,
  });

  final void Function(int index)? onDestinationSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.assignment, size: 25),
          label: "Assignments",
        ),
        NavigationDestination(
          icon: Icon(Icons.note_alt_sharp, size: 25),
          label: "Notes",
        ),
        NavigationDestination(
          icon: Icon(Icons.settings, size: 25),
          label: "Settings",
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
    );
  }
}
