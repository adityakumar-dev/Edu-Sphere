import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StudentAssignmentProvider extends ChangeNotifier {
  File? currentFile;
  String? errorMessage;
  Future<void> pickPdfFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
      if (result != null && result.files.single.path != null) {
        currentFile = File(result.files.single.path!);
      } else {
        errorMessage = "Please select File";
      }
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      errorMessage = e.toString();
    }
  }
}
