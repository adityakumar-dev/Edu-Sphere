import 'package:edusphere_mobile/features/home/screens/student_home_screen.dart';
import 'package:edusphere_mobile/shared/Constants/app_constants.dart';
import 'package:edusphere_mobile/shared/Models/student_model.dart';
import 'package:edusphere_mobile/shared/Storage/app_local_data.dart';
import 'package:edusphere_mobile/shared/widgets/shared_ui_item.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../shared/Models/teacher_model.dart';
import '../../../home/screens/teacher_home_screen.dart';

class AuthManager {
  static final supabaseAuth = Supabase.instance.client;

  static Future<dynamic> registerStudent(
    BuildContext context, {
    required StudentModel stModel,
    required String password,
  }) async {
    loaderDailog(context);
    try {
      // First attempt to insert student data into the database
      final insertResponse =
          await supabaseAuth.from('STUDENT').insert(stModel.toMap());
      print("Inner response is : $insertResponse");

      // If data insertion is successful, proceed to sign up
      if (insertResponse == null) {
        final response = await supabaseAuth.auth.signUp(
          email: stModel.email,
          password: password,
        );

        if (response.user != null) {
          // If sign-up is successful, store the student model locally
          await AppLocalData.storeStudentModel(stModel);
          Navigator.pop(context);

          // Navigate to Student Home Screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StudentHomeScreen(),
            ),
          );

          return {'success': true, 'message': 'Registration successful'};
        } else {
          Navigator.pop(context);

          return {'success': false, 'message': 'Failed to save student data'};
        }
      } else {
        Navigator.pop(context);

        // If sign-up fails, handle the error
        return {'success': false, 'message': 'Registration failed'};
      }
      // else {
      //   // If data insertion fails, handle the error
      //   return {'success': false, 'message': 'Failed to save student data'};
      // }
    } catch (error) {
      Navigator.pop(context);

      print(error);
      return {
        'success': false,
        'message': 'An error occurred: ${error.toString()}'
      };
    }
  }

  static Future<dynamic> registerTeacher(
    BuildContext context, {
    required TeacherModel tModel,
    required String password,
  }) async {
    loaderDailog(context);
    try {
      // First attempt to insert teacher data into the database
      final insertResponse =
          await supabaseAuth.from('TEACHER').insert(tModel.toMap());

      if (insertResponse == null) {
        // If data insertion is successful, proceed to sign up
        final response = await supabaseAuth.auth.signUp(
          email: tModel.email,
          password: password,
        );

        if (response.user != null) {
          // If sign-up is successful, navigate to Teacher Home Screen
          Navigator.pop(context);
          await AppLocalData.storeTeacherModel(tModel);
          await AppLocalData.storeAuthState(AppConstants.activeUser);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TeacherHomeScreen(),
            ),
          );

          return {'success': true, 'message': 'Registration successful'};
        } else {
          Navigator.pop(context);
          // If sign-up fails, handle the error
          return {'success': false, 'message': 'Registration failed'};
        }
      } else {
        Navigator.pop(context);
        // If data insertion fails, handle the error
        return {'success': false, 'message': 'Failed to save teacher data'};
      }
    } catch (error) {
      Navigator.pop(context);
      print(error);
      return {
        'success': false,
        'message': 'An error occurred: ${error.toString()}'
      };
    }
  }
}
