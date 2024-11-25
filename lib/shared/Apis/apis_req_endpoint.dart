class ApisReqEndpoint {
  static const String _baseUrl =
      "https://enabled-flowing-bedbug.ngrok-free.app";
  static uploadStudentAssignment() {
    return "$_baseUrl/student/upload-assignments";
  }

  static uploadTeacherAssignment() {
    return "$_baseUrl/teacher/upload-assignments";
  }

  static uploadTeacherNotes() {
    return "$_baseUrl/teacher/upload-notes";
  }

  static studentTokens() {
    return "$_baseUrl/student/user-verification";
  }

  static teacherTokens() {
    return "$_baseUrl/teacher/user-verification";
  }

  static refreshTokenEndpoint() {
    return "$_baseUrl/refresh-tokens";
  }
}
