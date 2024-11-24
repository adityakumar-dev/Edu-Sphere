import 'package:edusphere_mobile/features/account/backend/auth_logout.dart';
import 'package:edusphere_mobile/features/account/ui/widgets/account_log_out_button.dart';
import 'package:edusphere_mobile/core/form/student_account_form.dart';
import 'package:edusphere_mobile/features/account/ui/widgets/account_screen_appbar.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class StudentAccountScreen extends StatelessWidget {
  const StudentAccountScreen({super.key});

  void _validate() {
    // log(_formKey.currentState!.validate().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AccountScreenAppbar(onPressed: _validate),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            StudentAccountForm(),
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
