import 'package:edusphere_mobile/shared/Constants/app_constants.dart';
import 'package:edusphere_mobile/shared/Models/student_model.dart';
import 'package:edusphere_mobile/shared/Models/teacher_model.dart';
import 'package:edusphere_mobile/shared/tokens_manager.dart';
import 'package:hive_flutter/adapters.dart';

class AppLocalData {
  //Reset Or logout
  static Future<void> storeTokens() async {
    final box = await Hive.openBox(AppConstants.localDataBox);
    if (TokensManager.accessToken != null &&
        TokensManager.refreshToken != null) {
      box.put('accessToken', TokensManager.accessToken);
      box.put('refreshToken', TokensManager.refreshToken);
    }
  }

  static Future initTokens() async {
    final box = await Hive.openBox(AppConstants.localDataBox);
    TokensManager.accessToken = box.get('accessToken');
    TokensManager.refreshToken = box.get('refreshToken');
  }

  static Future<void> clearAllData() async {
    final box = await Hive.openBox(AppConstants.localDataBox);
    await box.clear();
  }

  //Store AuthState
  static Future storeAuthState(String key) async {
    final box = await Hive.openBox(AppConstants.localDataBox);
    box.put(key, true);
  }

  static Future getAuthState(String key) async {
    final box = await Hive.openBox(AppConstants.localDataBox);
    return await box.get(key);
  }

  // Store StudentModel to Hive box
  static Future<void> storeStudentModel(StudentModel st) async {
    final box = await Hive.openBox(AppConstants.localDataBox);
    box.put(AppConstants.studentLocalData, st);
  }

  // Store TeacherModel to Hive box
  static Future<void> storeTeacherModel(TeacherModel tl) async {
    final box = await Hive.openBox(AppConstants.localDataBox);
    box.put(AppConstants.teacherLocalData, tl);
  }

  // Get StudentModel from Hive box
  static Future<StudentModel?> getStudentModel() async {
    final box = await Hive.openBox(AppConstants.localDataBox);
    return box.get(AppConstants.studentLocalData);
  }

  // Get TeacherModel from Hive box
  static Future<TeacherModel?> getTeacherModel() async {
    final box = await Hive.openBox(AppConstants.localDataBox);
    return box.get(AppConstants.teacherLocalData);
  }
}
