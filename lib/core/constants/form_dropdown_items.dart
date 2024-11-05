import 'package:flutter/material.dart';

class FormDropdownItems {
  final List<DropdownMenuItem<String>> branchItems = const [
    DropdownMenuItem(value: "Branch 1", child: Text("Branch 1")),
    DropdownMenuItem(value: "Branch 2", child: Text("Branch 2")),
    DropdownMenuItem(value: "Branch 3", child: Text("Branch 3")),
    DropdownMenuItem(value: "Branch 4", child: Text("Branch 4")),
    DropdownMenuItem(value: "Branch 5", child: Text("Branch 5")),
    DropdownMenuItem(value: "Branch 6", child: Text("Branch 6")),
  ];

  final List<DropdownMenuItem<String>> semesterItems = const [
    DropdownMenuItem(value: "First", child: Text("First")),
    DropdownMenuItem(value: "Second", child: Text("Second")),
    DropdownMenuItem(value: "Third", child: Text("Third")),
    DropdownMenuItem(value: "Fourth", child: Text("Fourth")),
    DropdownMenuItem(value: "Fifth", child: Text("Fifith")),
    DropdownMenuItem(value: "Sixth", child: Text("Sixth")),
  ];
}
