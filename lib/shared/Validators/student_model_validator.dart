class StudentModelValidator {
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

  // Validator for the Roll Number field
  static String? validateRollNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Roll Number is required';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Roll Number must be numeric';
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

  // Validator for the Branch field
  static String? validateBranch(String? value) {
    if (value == null || value.isEmpty) {
      return 'Branch is required';
    }
    return null;
  }

  // Validator for the Semester field
  static String? validateSemester(String? value) {
    if (value == null || value.isEmpty) {
      return 'Semester is required';
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
