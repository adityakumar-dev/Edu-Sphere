import 'package:flutter/material.dart';
import 'package:edusphere_mobile/shared/Models/student_model.dart';

class StudentAuthProvider extends ChangeNotifier {
  // Model for storing data
  StudentModel _stl = StudentModel(
    name: '',
    rollNumber: '',
    branch: '',
    semester: '',
    email: '',
  );

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
}
