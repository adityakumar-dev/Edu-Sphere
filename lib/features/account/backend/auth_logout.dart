import 'package:edusphere_mobile/features/greeting/welcome_screen.dart';
import 'package:edusphere_mobile/shared/Storage/app_local_data.dart';
import 'package:edusphere_mobile/shared/widgets/shared_ui_item.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLogout {
  static Future<void> logoutCurrentUser(BuildContext context) async {
    loaderDailog(context);
    await AppLocalData.clearAllData();
    await Supabase.instance.client.auth.signOut();
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
    );
  }
}
