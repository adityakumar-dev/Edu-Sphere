import 'package:edusphere_mobile/shared/Constants/app_constants.dart';
import 'package:edusphere_mobile/shared/Models/student_model.dart';
import 'package:edusphere_mobile/shared/Models/teacher_model.dart';
import 'package:edusphere_mobile/shared/Storage/app_local_data.dart';
import 'package:edusphere_mobile/shared/providers/Auth/student_auth_provider.dart';
import 'package:edusphere_mobile/shared/providers/Auth/teacher_auth_provider.dart';
import 'package:edusphere_mobile/shared/widgets/shared_ui_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthManagerLogin {
  static final supabaseAuth = Supabase.instance.client;

  // Method for student login
  static Future<dynamic> loginStudent(
    BuildContext context, {
    required StudentModel stl,
    required String password,
  }) async {
    print(stl.email);
    print(password);
    loaderDailog(context); // Show loader while logging in
    try {
      // Attempt to sign in with email and password
      final response = await supabaseAuth.auth.signInWithPassword(
        email: stl.email,
        password: password,
      );
      print(response.user);
      if (response.user != null) {
        // Fetch student data if login is successful
        final data = await supabaseAuth
            .from('STUDENT')
            .select('*')
            .eq('email', stl.email)
            .single();

        final provider =
            Provider.of<StudentAuthProvider>(context, listen: false);
        provider.init(StudentModel.fromMap(data));
        await AppLocalData.storeAuthState(AppConstants.activeUser);
        await AppLocalData.storeStudentModel(StudentModel.fromMap(data));
        await provider.initStudentUser();
        Navigator.pop(context);
        return {'success': true, 'data': data};
      } else {
        Navigator.pop(context);
        return {'success': false, 'message': 'Login failed'};
      }
    } on AuthException catch (error) {
      Navigator.pop(context);
      return {'success': false, 'message': error.message};
    } catch (error) {
      Navigator.pop(context);
      return {'success': false, 'message': error.toString()};
    }
  }

  // Method for teacher login
  static Future<dynamic> loginTeacher(
    BuildContext context, {
    required TeacherModel tl,
    required String password,
  }) async {
    loaderDailog(context);
    try {
      final response = await supabaseAuth.auth.signInWithPassword(
        email: tl.email,
        password: password,
      );

      if (response.user != null) {
        // Fetch teacher data if login is successful
        final data = await supabaseAuth
            .from('TEACHER')
            .select('*')
            .eq('email', tl.email)
            .single();

        final provider =
            Provider.of<TeacherAuthProvider>(context, listen: false);
        provider.init(TeacherModel.fromMap(data));
        await provider.initTeacherUser();
        await AppLocalData.storeAuthState(AppConstants.activeUser);
        await AppLocalData.storeTeacherModel(TeacherModel.fromMap(data));
        Navigator.pop(context);

        return {'success': true, 'data': data};
      } else {
        Navigator.pop(context);
        return {'success': false, 'message': 'Login failed'};
      }
    } on AuthException catch (error) {
      print(error);
      Navigator.pop(context);
      return {'success': false, 'message': error.message};
    } catch (error) {
      print(error);
      Navigator.pop(context);
      return {'success': false, 'message': error.toString()};
    }
  }
}
