import 'package:flutter/material.dart';

class EdusphereAuthManagerProvider extends ChangeNotifier {
  // Private fields
  bool _isLoggedIn = false;
  bool _isStudentLogin = false;
  bool _isTeacherLogin = false;

  // Getters
  bool get isLoggedIn => _isLoggedIn;
  bool get isStudentLogin => _isStudentLogin;
  bool get isTeacherLogin => _isTeacherLogin;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  set isStudentLogin(bool value) {
    _isStudentLogin = value;
    notifyListeners();
  }

  set isTeacherLogin(bool value) {
    _isTeacherLogin = value;
    notifyListeners();
  }
}
