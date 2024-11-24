import 'package:edusphere_mobile/features/home/screens/student_home_screen.dart';
import 'package:edusphere_mobile/features/login/backend/auth_manager/auth_manager.dart';
import 'package:edusphere_mobile/shared/Models/student_model.dart';
import 'package:edusphere_mobile/shared/providers/Auth/student_auth_provider.dart';
import 'package:edusphere_mobile/shared/widgets/password_entry.dart';
import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class StudentLoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  StudentLoginForm({super.key});

  void _navigateToHomeScreen(
      BuildContext context, StudentModel stl, String password) async {
    await AuthManagerLogin.loginStudent(context, stl: stl, password: password)
        .then((res) {
      if (res['success'] == true) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const StudentHomeScreen(),
          ),
        );
      } else {
        Fluttertoast.showToast(msg: res['message']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentAuthProvider>(
      builder: (_, stl, __) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              StudentLoginEmailEntry(
                controller: stl.emailController,
                onChange: (String? txt) {
                  stl.updateEmail(txt ?? '');
                },
              ),
              StudentLoginPasswordEntry(
                controller: stl.passwordController,
                onChange: (String? txt) {
                  print(txt);
                  stl.updatePassword(txt ?? '');
                },
              ),
              StudentAccountLoginButton(
                onPressed: () =>
                    _navigateToHomeScreen(context, stl.stl, stl.password!),
              ),
            ],
          ),
        );
      },
    );
  }
}

class StudentLoginEmailEntry extends StatelessWidget {
  const StudentLoginEmailEntry(
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
        validator: (value) => null,
        onChanged: onChange,
      ),
    );
  }
}

class StudentLoginPasswordEntry extends StatelessWidget {
  const StudentLoginPasswordEntry(
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
        validator: (value) => null,
        onChanged: onChange,
      ),
    );
  }
}

class StudentAccountLoginButton extends StatelessWidget {
  const StudentAccountLoginButton({super.key, required this.onPressed});

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
