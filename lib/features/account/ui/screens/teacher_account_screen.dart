import 'package:edusphere_mobile/features/account/backend/auth_logout.dart';
import 'package:edusphere_mobile/features/account/ui/widgets/account_log_out_button.dart';
import 'package:edusphere_mobile/core/form/teacher_account_form.dart';
import 'package:edusphere_mobile/features/account/ui/widgets/account_screen_appbar.dart';
import 'package:edusphere_mobile/features/greeting/welcome_screen.dart';
import 'package:edusphere_mobile/features/login/backend/auth_manager/auth_manager.dart';
import 'package:edusphere_mobile/shared/Storage/app_local_data.dart';
import 'package:edusphere_mobile/shared/widgets/shared_ui_item.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class TeacherAccountScreen extends StatelessWidget {
  const TeacherAccountScreen({super.key});

  void _validate() {
    log(_formKey.currentState!.validate().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AccountScreenAppbar(onPressed: _validate),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TeacherAccountForm(formKey: _formKey),
            AccountLogOutButton(
              onPressed: () async {
                await AuthLogout.logoutCurrentUser(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
