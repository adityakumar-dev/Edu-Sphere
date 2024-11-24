import 'package:edusphere_mobile/features/registeration/backend/auth_manager/auth_manager.dart';
import 'package:edusphere_mobile/features/registeration/ui/widgets/registeration_screen_appbar.dart';
import 'package:edusphere_mobile/core/form/teacher_account_form.dart';
import 'package:edusphere_mobile/shared/providers/Auth/teacher_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<FormState> _teacherFormKey = GlobalKey<FormState>();

class TeacherRegisterationScreen extends StatelessWidget {
  const TeacherRegisterationScreen({super.key});

  void _validateForm(BuildContext context) async {
    if (_teacherFormKey.currentState!.validate()) {
      final provider = Provider.of<TeacherAuthProvider>(context, listen: false);
      await AuthManager.registerTeacher(context,
          tModel: provider.tl, password: provider.password ?? '');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You are now registered!!"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegisterationScreenAppbar(onSubmit: () => _validateForm(context)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: TeacherAccountForm(formKey: _teacherFormKey),
      ),
    );
  }
}
