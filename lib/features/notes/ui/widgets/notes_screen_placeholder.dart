import 'package:flutter/material.dart';

class NotesScreenPlaceholder extends StatelessWidget {
  const NotesScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.note_alt, size: 100, color: _iconColor(context)),
          Text("No Notes", style: _labelStyle()),
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

  TextStyle _labelStyle() => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      );
}
