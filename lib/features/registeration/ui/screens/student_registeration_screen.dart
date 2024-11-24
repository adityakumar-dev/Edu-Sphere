import 'package:edusphere_mobile/features/registeration/backend/auth_manager/auth_manager.dart';
import 'package:edusphere_mobile/features/registeration/ui/widgets/registeration_screen_appbar.dart';
import 'package:edusphere_mobile/core/form/student_account_form.dart';
import 'package:edusphere_mobile/shared/providers/Auth/student_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<FormState> _studentFormKey = GlobalKey<FormState>();

class StudentRegisterationScreen extends StatelessWidget {
  const StudentRegisterationScreen({super.key});

  void _validateForm(BuildContext context) async {
    if (_studentFormKey.currentState!.validate()) {
      final provider = Provider.of<StudentAuthProvider>(context, listen: false);
      // print(provider.stl.name);
      if (provider.password != null) {
        final response = await AuthManager.registerStudent(context,
            stModel: provider.stl, password: provider.password!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response['message']),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegisterationScreenAppbar(onSubmit: () => _validateForm(context)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: StudentAccountForm(formKey: _studentFormKey),
      ),
    );
  }
}
