import 'package:edusphere_mobile/core/constants/form_dropdown_items.dart';
import 'package:edusphere_mobile/shared/Validators/teacher_model_validator.dart';
import 'package:edusphere_mobile/shared/providers/Auth/teacher_auth_provider.dart';
import 'package:edusphere_mobile/shared/widgets/dropdown_feild.dart';
import 'package:edusphere_mobile/shared/widgets/password_entry.dart';
import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherAccountForm extends StatelessWidget {
  const TeacherAccountForm({super.key, this.formKey});

  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    return Consumer<TeacherAuthProvider>(
      builder: (_, value, __) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\t Personal Info", style: _headingStyle(context)),
              TeacherNameEntry(
                controller: value.nameController,
                onChange: (String txt) {},
                validator: TeacherModelValidator.validateName,
              ),
              TeacherBranchSelector(
                value: value.tl.branch == '' ? null : value.tl.branch,
                onChange: (String txt) {
                  value.updateBranch(txt);
                },
                validator: TeacherModelValidator.validateBranch,
              ),
              Text("\t Authentication", style: _headingStyle(context)),
              TeacherEmailEntry(
                  controller: value.emailController,
                  onChange: (String txt) {
                    // value.updateEmail(txt);
                  },
                  validator: TeacherModelValidator.validateEmail),
              TeacherPasswordEntry(
                  controller: value.passwordController,
                  onChange: (String txt) {
                    // value.updatePassword(txt);
                  },
                  validator: TeacherModelValidator.validatePassword),
              TeacherConfirmPasswordEntry(
                controller: value.confirmPasswordController,
                pass: value.password ?? '',
                validator: TeacherModelValidator.validateConfirmPassword,
              ),
            ],
          ),
        );
      },
    );
  }

  TextStyle _headingStyle(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xffaac7ff)
            : const Color(0xff415f91),
      );
}

TextStyle _headingStyle(BuildContext context) => TextStyle(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xffaac7ff)
          : const Color(0xff415f91),
    );
// }

class TeacherNameEntry extends StatelessWidget {
  const TeacherNameEntry(
      {super.key,
      required this.controller,
      required this.onChange,
      required this.validator});

  final TextEditingController controller;
  final Function(String txt) onChange;
  final String? Function(String? txt) validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextEntry(
        labelText: "Name",
        textCapitalization: TextCapitalization.words,
        controller: controller,
        validator: validator,
      ),
    );
  }
}

class TeacherBranchSelector extends StatelessWidget {
  const TeacherBranchSelector(
      {super.key, this.value, required this.onChange, required this.validator});

  final dynamic value;
  final Function(String txt) onChange;
  final String? Function(String? txt) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: DropdownFeild(
        items: FormDropdownItems().branchItems,
        labelText: "Branch",
        value: value,
        onChanged: (value) {
          onChange(
            value.toString(),
          );
        },
        validator: (v) => validator(
          v.toString(),
        ),
      ),
    );
  }
}

class TeacherEmailEntry extends StatelessWidget {
  const TeacherEmailEntry(
      {super.key,
      required this.controller,
      required this.onChange,
      required this.validator});

  final TextEditingController controller;
  final Function(String txt) onChange;
  final String? Function(String? txt) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextEntry(
        labelText: "Email",
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        onChanged: onChange,
        validator: validator,
      ),
    );
  }
}

class TeacherPasswordEntry extends StatelessWidget {
  const TeacherPasswordEntry(
      {super.key,
      required this.controller,
      required this.onChange,
      required this.validator});

  final TextEditingController controller;
  final Function(String txt) onChange;
  final String? Function(String? txt) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: PasswordEntry(
        labelText: "Password",
        controller: controller,
        onChanged: onChange,
        validator: validator,
      ),
    );
  }
}

class TeacherConfirmPasswordEntry extends StatelessWidget {
  const TeacherConfirmPasswordEntry(
      {super.key,
      required this.controller,
      required this.validator,
      required this.pass});

  final TextEditingController controller;
  final String pass;
  final String? Function(String? txt, String pass) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: PasswordEntry(
        labelText: "Confirm Password",
        controller: controller,
        validator: (value) {
          print("$value, $pass");
          return validator(value, pass);
        },
      ),
    );
  }
}
