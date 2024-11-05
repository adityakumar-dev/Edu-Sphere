import 'package:edusphere_mobile/core/constants/form_dropdown_items.dart';
import 'package:edusphere_mobile/shared/widgets/dropdown_feild.dart';
import 'package:edusphere_mobile/shared/widgets/password_entry.dart';
import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';

final TextEditingController _name = TextEditingController();
final TextEditingController _rollNumber = TextEditingController();
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
final TextEditingController _confirmedPassword = TextEditingController();

String? _branch, _semester;

class StudentAccountForm extends StatelessWidget {
  const StudentAccountForm({super.key, this.formKey});

  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("\t Personal Info", style: _headingStyle(context)),
          StudentNameEntry(controller: _name),
          StudentRollNumberEntry(controller: _rollNumber),
          StudentBranchSelector(value: _branch),
          StudentSemesterSelector(value: _semester),
          Text("\t Authentication", style: _headingStyle(context)),
          StudentEmailEntry(controller: _email),
          StudentPasswordEntry(controller: _password),
          StudentConfirmPasswordEntry(controller: _confirmedPassword),
        ],
      ),
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
  const StudentNameEntry({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextEntry(
        labelText: "Name",
        textCapitalization: TextCapitalization.words,
        controller: controller,
      ),
    );
  }
}

class StudentRollNumberEntry extends StatelessWidget {
  const StudentRollNumberEntry({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextEntry(
        labelText: "Roll Number",
        keyboardType: TextInputType.number,
        controller: controller,
      ),
    );
  }
}

class StudentBranchSelector extends StatelessWidget {
  const StudentBranchSelector({super.key, this.value});

  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: DropdownFeild(
        items: FormDropdownItems().branchItems,
        labelText: "Branch",
        value: value,
        onChanged: (value) {},
      ),
    );
  }
}

class StudentSemesterSelector extends StatelessWidget {
  const StudentSemesterSelector({super.key, this.value});

  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: DropdownFeild(
        items: FormDropdownItems().semesterItems,
        labelText: "Semester",
        value: value,
        onChanged: (value) {},
      ),
    );
  }
}

class StudentEmailEntry extends StatelessWidget {
  const StudentEmailEntry({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextEntry(
        labelText: "Email",
        keyboardType: TextInputType.emailAddress,
        controller: controller,
      ),
    );
  }
}

class StudentPasswordEntry extends StatelessWidget {
  const StudentPasswordEntry({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: PasswordEntry(labelText: "Password", controller: controller),
    );
  }
}

class StudentConfirmPasswordEntry extends StatelessWidget {
  const StudentConfirmPasswordEntry({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: PasswordEntry(
        labelText: "Confirm Password",
        controller: controller,
      ),
    );
  }
}
