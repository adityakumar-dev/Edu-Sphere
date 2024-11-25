import 'dart:convert';

import 'package:edusphere_mobile/shared/Apis/apis_req_endpoint.dart';
import 'package:edusphere_mobile/shared/Storage/app_local_data.dart';
import 'package:edusphere_mobile/shared/tokens_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:edusphere_mobile/shared/Models/student_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class StudentAuthProvider extends ChangeNotifier {
  // Model for storing data
  StudentModel _stl = StudentModel(
    name: '',
    rollNumber: '',
    branch: '',
    semester: '',
    email: '',
  );
  String _subjectCode = "";
  String get subjectCode => _subjectCode;
  String _fileName = "";
  String get fileName => _fileName;
  String? _password;
  String? get password => _password;

  String? _confirmPassword;
  String? get confirmPassword => _confirmPassword;
  // Text controllers for the form
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController subjectCodeController = TextEditingController();
  final TextEditingController asssignmnetFileController =
      TextEditingController();
  StudentModel get stl => _stl;

  // Constructor to add listeners
  StudentAuthProvider() {
    nameController.addListener(() => updateName(nameController.text));
    rollNumberController
        .addListener(() => updateRollNumber(rollNumberController.text));
    emailController.addListener(() => updateEmail(emailController.text));
    passwordController
        .addListener(() => updatePassword(passwordController.text));
    confirmPasswordController
        .addListener(() => updatePassword(confirmPasswordController.text));
    subjectCodeController
        .addListener(() => updateSubjectCode(subjectCodeController.text));
    asssignmnetFileController.addListener(() {
      _fileName = asssignmnetFileController.text;
      notifyListeners();
    });
  }

  // Initialize model from an existing object
  void init(StudentModel s) {
    _stl = s;
    _password = null;
    nameController.text = s.name;
    rollNumberController.text = s.rollNumber;
    emailController.text = s.email;
    notifyListeners();
  }

  // Reset model data
  void reset() {
    _stl = StudentModel(
      name: '',
      rollNumber: '',
      branch: '',
      semester: '',
      email: '',
    );
    _password = null;
    nameController.clear();
    rollNumberController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();

    notifyListeners();
  }

  void updateSubjectCode(String txt) {
    _subjectCode = txt;
    notifyListeners();
  }

  // Update methods
  void updatePassword(String pass) {
    _password = pass;
    notifyListeners();
  }

  void updateEmail(String txt) {
    _stl.email = txt;
    notifyListeners();
  }

  void updateName(String txt) {
    _stl.name = txt;
    notifyListeners();
  }

  void updateBranch(String txt) {
    _stl.branch = txt;
    notifyListeners();
  }

  void updateRollNumber(String txt) {
    _stl.rollNumber = txt;
    notifyListeners();
  }

  void updateSemester(String txt) {
    _stl.semester = txt;
    notifyListeners();
  }

  void updateConfirmPassword(String txt) {
    _confirmPassword = txt;
  }

  @override
  void dispose() {
    nameController.dispose();
    rollNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> initStudentUser() async {
    try {
      final response = await http.post(
        Uri.parse(ApisReqEndpoint.studentTokens()),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": stl.email,
          "name": stl.name,
          "rollNumber": stl.rollNumber,
        }),
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body)['data'];
        TokensManager.accessToken = data['data']['accessToken'];
        TokensManager.refreshToken = data['data']['refreshToken'];
        await AppLocalData.storeTokens();
        if (kDebugMode) {
          print(data);
        }
        Fluttertoast.showToast(
            msg: "Tokens successfully retrieved!",
            backgroundColor: Colors.green);
      } else {
        Fluttertoast.showToast(
            msg: "Failed to get tokens from server!",
            backgroundColor: Colors.red);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Fluttertoast.showToast(
          msg: "Unexpected Error!", backgroundColor: Colors.red);
    }
  }
}
