import 'package:edusphere_mobile/core/constants/form_dropdown_items.dart';
import 'package:edusphere_mobile/shared/widgets/dropdown_feild.dart';
import 'package:edusphere_mobile/shared/widgets/password_entry.dart';
import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';

final TextEditingController _name = TextEditingController();
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
final TextEditingController _confirmedPassword = TextEditingController();

String? _branch;

class TeacherAccountForm extends StatelessWidget {
  const TeacherAccountForm({super.key, this.formKey});

  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("\t Personal Info", style: _headingStyle(context)),
          TeacherNameEntry(controller: _name),
          TeacherBranchSelector(value: _branch),
          Text("\t Authentication", style: _headingStyle(context)),
          TeacherEmailEntry(controller: _email),
          TeacherPasswordEntry(controller: _password),
          TeacherConfirmPasswordEntry(controller: _confirmedPassword),
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

class TeacherNameEntry extends StatelessWidget {
  const TeacherNameEntry({super.key, required this.controller});

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

class TeacherBranchSelector extends StatelessWidget {
  const TeacherBranchSelector({super.key, this.value});

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

class TeacherEmailEntry extends StatelessWidget {
  const TeacherEmailEntry({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextEntry(
        labelText: "Email",
        controller: controller,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}

class TeacherPasswordEntry extends StatelessWidget {
  const TeacherPasswordEntry({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: PasswordEntry(labelText: "Password", controller: controller),
    );
  }
}

class TeacherConfirmPasswordEntry extends StatelessWidget {
  const TeacherConfirmPasswordEntry({super.key, required this.controller});

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
