import 'package:edusphere_mobile/core/theme/app_theme_data.dart';
import 'package:edusphere_mobile/features/greeting/welcome_screen.dart';
import 'package:edusphere_mobile/shared/Models/student_model.dart';
import 'package:edusphere_mobile/shared/Models/teacher_model.dart';
import 'package:edusphere_mobile/shared/providers/upload_data_provider/student_assignment_provider.dart';
import 'package:edusphere_mobile/shared/providers/Auth/student_auth_provider.dart';
import 'package:edusphere_mobile/shared/providers/Auth/teacher_auth_provider.dart';
import 'package:edusphere_mobile/shared/providers/edusphere_auth_manager_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());
  Hive.registerAdapter(TeacherModelAdapter());

  await Supabase.initialize(
      anonKey: dotenv.env['ANONKEY']!, url: dotenv.env['URL']!);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StudentAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EdusphereAuthManagerProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TeacherAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UploadDataProvider(),
        ),
      ],
      child: MaterialApp(
        theme: AppThemeData().lightTheme,
        darkTheme: AppThemeData().darkTheme,
        home: const WelcomeScreen(),
      ),
    );
  }
}
