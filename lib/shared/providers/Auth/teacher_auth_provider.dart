import 'package:edusphere_mobile/shared/Models/teacher_model.dart';
import 'package:flutter/material.dart';

class TeacherAuthProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
    // Initialize the controllers with the current data
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
