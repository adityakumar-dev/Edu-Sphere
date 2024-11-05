import 'package:edusphere_mobile/features/registeration/ui/widgets/registeration_screen_appbar.dart';
import 'package:edusphere_mobile/core/form/student_account_form.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> _studentFormKey = GlobalKey<FormState>();

class StudentRegisterationScreen extends StatelessWidget {
  const StudentRegisterationScreen({super.key});

  void _validateForm(BuildContext context) {
    if (_studentFormKey.currentState!.validate()) {
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
        child: StudentAccountForm(formKey: _studentFormKey),
      ),
    );
  }
}
