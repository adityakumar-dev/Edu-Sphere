class TeacherModelValidator {
  // Validator for the Name field
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  // Validator for the Email field
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Validator for the Subject field
  static String? validateSubject(String? value) {
    if (value == null || value.isEmpty) {
      return 'Subject is required';
    }
    return null;
  }

  // Validator for the Department field
  static String? validateBranch(String? value) {
    if (value == null || value.isEmpty) {
      return 'Branch is required';
    }
    return null;
  }

  // Validator for the Password field
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // Validator for Confirm Password field
  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
