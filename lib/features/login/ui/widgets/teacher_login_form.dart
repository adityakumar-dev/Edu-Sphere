import 'package:edusphere_mobile/features/home/screens/teacher_home_screen.dart';
import 'package:edusphere_mobile/features/login/backend/auth_manager/auth_manager.dart';
import 'package:edusphere_mobile/shared/Validators/teacher_model_validator.dart';
import 'package:edusphere_mobile/shared/providers/Auth/teacher_auth_provider.dart';
import 'package:edusphere_mobile/shared/widgets/password_entry.dart';
import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class TeacherLoginForm extends StatelessWidget {
  TeacherLoginForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _navigateToHomeScreen(BuildContext context) async {
    final provider = Provider.of<TeacherAuthProvider>(context, listen: false);
    final response = await AuthManagerLogin.loginTeacher(context,
        tl: provider.tl, password: provider.password ?? '');
    if (response['success']) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TeacherHomeScreen(),
        ),
      );
    } else {
      Fluttertoast.showToast(msg: response['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TeacherAuthProvider>(
      builder: (_, value, __) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              TeacherLoginEmailEntry(
                controller: value.emailController,
                onChange: (txt) {
                  // value.updateEmail(txt ?? '');
                },
              ),
              TeacherLoginPasswordEntry(
                controller: value.passwordController,
                onChange: (txt) {
                  // value.updatePassword(txt ?? '');
                },
              ),
              TeacherAccountLoginButton(
                onPressed: () => _navigateToHomeScreen(context),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TeacherLoginEmailEntry extends StatelessWidget {
  const TeacherLoginEmailEntry(
      {super.key, required this.controller, required this.onChange});

  final TextEditingController controller;
  final Function(String? txt) onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextEntry(
        labelText: "Email",
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        validator: (value) => TeacherModelValidator.validateEmail(value),
        onChanged: onChange,
      ),
    );
  }
}

class TeacherLoginPasswordEntry extends StatelessWidget {
  const TeacherLoginPasswordEntry(
      {super.key, required this.controller, required this.onChange});

  final TextEditingController controller;
  final Function(String? txt) onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: PasswordEntry(
        labelText: "Password",
        controller: controller,
        validator: (value) => TeacherModelValidator.validatePassword(value),
        onChanged: onChange,
      ),
    );
  }
}

class TeacherAccountLoginButton extends StatelessWidget {
  const TeacherAccountLoginButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: FilledButton(
        onPressed: onPressed,
        child: Text("Login", style: _labelStyle()),
      ),
    );
  }

  TextStyle _labelStyle() => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
}
