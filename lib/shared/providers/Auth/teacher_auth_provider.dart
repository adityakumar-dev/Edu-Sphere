import 'dart:convert';

import 'package:edusphere_mobile/shared/Apis/apis_req_endpoint.dart';
import 'package:edusphere_mobile/shared/Models/teacher_model.dart';
import 'package:edusphere_mobile/shared/Storage/app_local_data.dart';
import 'package:edusphere_mobile/shared/tokens_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class TeacherAuthProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController subjectCodeController = TextEditingController();
  final TextEditingController filesController = TextEditingController();

  String _subjectCode = "";
  String get subjectCode => _subjectCode;

  TeacherModel _tl = TeacherModel(
    name: '',
    branch: '',
    email: '',
  );
  String? _password;
  String? get password => _password;
  String? _confirmPassword;
  String? get confirmPassword => _confirmPassword;
  TeacherModel _orginalModel = TeacherModel(
    name: '',
    branch: '',
    email: '',
  );
  TeacherModel get originalModel => _orginalModel;
  TeacherModel get tl => _tl;

  TeacherAuthProvider() {
    nameController.addListener(() {
      _tl.name = nameController.text;
    });
    emailController.addListener(() {
      _tl.email = emailController.text;
    });
    passwordController.addListener(() {
      _password = passwordController.text;
    });
    confirmPasswordController.addListener(() {
      _confirmPassword = confirmPasswordController.text;
    });
    subjectCodeController.addListener(() {
      _subjectCode = subjectCodeController.text;
    });
  }
  Future<void> initTeacherUser() async {
    try {
      final response = await http.post(
        Uri.parse(ApisReqEndpoint.teacherTokens()),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": tl.email,
          "name": tl.name,
        }),
      );
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

  void init(TeacherModel s) {
    _tl = s;
    nameController.text = s.name;
    emailController.text = s.email;

    notifyListeners();
  }

  updateOriginal() {
    _orginalModel = _tl;
    notifyListeners();
  }

  resetFail() {
    _tl = _orginalModel;
  }

  void reset() {
    _tl = TeacherModel(
      name: '',
      branch: '',
      email: '',
    );
    _password = null;
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    notifyListeners();
  }

  void updateBranch(String txt) {
    _tl.branch = txt;
    notifyListeners();
  }
}
