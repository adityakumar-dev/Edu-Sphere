import 'dart:io';

import 'package:edusphere_mobile/shared/Apis/apis_req_endpoint.dart';
import 'package:edusphere_mobile/shared/tokens_manager.dart';
import 'package:edusphere_mobile/shared/widgets/shared_ui_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

class UploadDataProvider extends ChangeNotifier {
  File? currentFile;
  String? errorMessage;
  bool? isLastUploadSuccess;
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

  Future<void> uploadDataWithHeaders(BuildContext context, String subject,
      String email, String name, String uri) async {
    try {
      loaderDailog(context);
      var request = http.MultipartRequest('POST', Uri.parse(uri));
      request.headers['authorization'] = TokensManager.accessToken ?? '';
      request.fields['subject'] = subject;
      request.fields['email'] = email;
      request.fields['name'] = name;

      if (currentFile != null) {
        String fileName = p.basename(currentFile!.path);

        request.files.add(
          await http.MultipartFile.fromPath(
            'file',
            currentFile!.path,
            filename: fileName,
          ),
        );
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "No file selected to upload!");
        return;
      }

      var response = await request.send();

      var responseData = await http.Response.fromStream(response);
      Navigator.pop(context);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Assignment uploaded successfully!");
        print('Response: ${responseData.body}');
        isLastUploadSuccess = true;
        notifyListeners();
        isLastUploadSuccess = null;
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: "Failed to upload assignment!");
        print('Error: ${responseData.body}');
      }
    } catch (e) {
      Navigator.pop(context);

      Fluttertoast.showToast(msg: "Error uploading assignment: $e");
      print('Error uploading assignment: $e');
    }
  }
}
