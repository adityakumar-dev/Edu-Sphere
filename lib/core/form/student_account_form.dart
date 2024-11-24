import 'package:edusphere_mobile/core/constants/form_dropdown_items.dart';
import 'package:edusphere_mobile/shared/Validators/student_model_validator.dart';
import 'package:edusphere_mobile/shared/providers/Auth/student_auth_provider.dart';
import 'package:edusphere_mobile/shared/widgets/dropdown_feild.dart';
import 'package:edusphere_mobile/shared/widgets/password_entry.dart';
import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentAccountForm extends StatelessWidget {
  const StudentAccountForm({super.key, this.formKey});

  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentAuthProvider>(
      builder: (_, stl, __) {
        final model = stl.stl;

        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\t Personal Info", style: _headingStyle(context)),
              StudentNameEntry(
                controller: stl.nameController,
                onChange: (String? txt) {
                  // stl.updateName(txt ?? '');
                },
                validator: StudentModelValidator.validateName,
              ),
              StudentRollNumberEntry(
                controller: stl.rollNumberController,
                onChange: (String? txt) {
                  // stl.updateRollNumber(txt ?? '');
                },
                validator: StudentModelValidator.validateRollNumber,
              ),
              StudentBranchSelector(
                value: model.branch == '' ? null : model.branch,
                onChange: (String? value) {
                  if (value != null) {
                    stl.updateBranch(value ?? '');
                  }
                },
                validator: StudentModelValidator.validateBranch,
              ),
              StudentSemesterSelector(
                value: model.semester == '' ? null : model.semester,
                onChange: (String? value) {
                  if (value != null) {
                    stl.updateSemester(value);
                  }
                },
                validator: StudentModelValidator.validateSemester,
              ),
              Text("\t Authentication", style: _headingStyle(context)),
              StudentEmailEntry(
                controller: stl.emailController,
                onChange: (String? txt) {
                  // stl.updateEmail(txt ?? '');
                },
                validator: StudentModelValidator.validateEmail,
              ),
              StudentPasswordEntry(
                controller: stl.passwordController,
                onChange: (String? txt) {
                  // stl.updatePassword(txt ?? '');
                },
                validator: StudentModelValidator.validatePassword,
              ),
              StudentConfirmPasswordEntry(
                controller: stl.confirmPasswordController,
                pass: stl.password ?? '',
                validator: StudentModelValidator.validateConfirmPassword,
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

class StudentNameEntry extends StatelessWidget {
  const StudentNameEntry(
      {super.key,
      required this.controller,
      required this.onChange,
      required this.validator});

  final TextEditingController controller;
  final Function(String? txt) onChange;
  final String? Function(String? txt) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextEntry(
        labelText: "Name",
        textCapitalization: TextCapitalization.words,
        controller: controller,
        onChanged: onChange,
        validator: validator,
      ),
    );
  }
}

class StudentRollNumberEntry extends StatelessWidget {
  const StudentRollNumberEntry(
      {super.key,
      required this.controller,
      required this.onChange,
      required this.validator});

  final TextEditingController controller;
  final Function(String? txt) onChange;
  final String? Function(String? txt) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextEntry(
        labelText: "Roll Number",
        keyboardType: TextInputType.number,
        controller: controller,
        onChanged: onChange,
        validator: validator,
      ),
    );
  }
}

class StudentBranchSelector extends StatelessWidget {
  const StudentBranchSelector(
      {super.key, this.value, required this.onChange, required this.validator});

  final String? value;
  final Function(String? value) onChange;
  final String? Function(String? txt) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: DropdownFeild(
        items: FormDropdownItems().branchItems,
        labelText: "Branch",
        value: value,
        onChanged: (v) {
          onChange(v.toString());
        },
        validator: (value) => validator(value.toString()),
      ),
    );
  }
}

class StudentSemesterSelector extends StatelessWidget {
  const StudentSemesterSelector(
      {super.key, this.value, required this.onChange, required this.validator});

  final String? value;
  final Function(String? value) onChange;
  final String? Function(String? txt) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: DropdownFeild(
        items: FormDropdownItems().semesterItems,
        labelText: "Semester",
        value: value,
        onChanged: (v) {
          onChange(v.toString());
        },
        validator: (v) => validator(v.toString()),
      ),
    );
  }
}

class StudentEmailEntry extends StatelessWidget {
  const StudentEmailEntry(
      {super.key,
      required this.controller,
      required this.onChange,
      required this.validator});

  final TextEditingController controller;
  final Function(String? txt) onChange;
  final String? Function(String? txt) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextEntry(
        labelText: "Email",
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        onChanged: onChange,
        validator: validator,
      ),
    );
  }
}

class StudentPasswordEntry extends StatelessWidget {
  const StudentPasswordEntry(
      {super.key,
      required this.controller,
      required this.onChange,
      required this.validator});

  final TextEditingController controller;
  final Function(String? txt) onChange;
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

class StudentConfirmPasswordEntry extends StatelessWidget {
  const StudentConfirmPasswordEntry(
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
          return validator(value, pass);
        },
      ),
    );
  }
}
