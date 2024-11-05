import 'package:flutter/material.dart';

class AssignmentPagePlaceholder extends StatelessWidget {
  const AssignmentPagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.book, size: 100, color: _iconColor(context)),
          Text("No Assignments", style: _headingStyle()),
        ],
      ),
    );
  }

  Color _iconColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.white38;
    } else {
      return Colors.black38;
    }
  }

  TextStyle _headingStyle() => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      );
}
