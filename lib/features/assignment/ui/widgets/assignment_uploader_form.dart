import 'package:edusphere_mobile/core/widgets/file_uploader_feild.dart';
import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final TextEditingController _name = TextEditingController();
final TextEditingController _subjectCode = TextEditingController();
final TextEditingController _fileName = TextEditingController();

class AssignmentUploaderForm extends StatelessWidget {
  const AssignmentUploaderForm({super.key});

  void verifyUploadForm() {
    log(_formKey.currentState!.validate().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StudentRollNumberEntry(controller: _name),
          SubjectCodeEntry(controller: _subjectCode),
          AssignmentFilePicker(controller: _fileName),
          UploadAssignmentButton(onPressed: verifyUploadForm),
        ],
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextEntry(
        labelText: "Roll Number",
        keyboardType: TextInputType.number,
        controller: controller,
      ),
    );
  }
}

class SubjectCodeEntry extends StatelessWidget {
  const SubjectCodeEntry({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextEntry(
        labelText: "Subject Code",
        textCapitalization: TextCapitalization.characters,
        controller: controller,
      ),
    );
  }
}

class AssignmentFilePicker extends StatelessWidget {
  const AssignmentFilePicker({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return FileUploaderFeild(
      controller: controller,
      onPressed: () {},
      labelText: "Assignment File",
    );
  }
}

class UploadAssignmentButton extends StatelessWidget {
  const UploadAssignmentButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: FilledButton(
        onPressed: onPressed,
        child: Text("Upload Assignment", style: _labelStyle()),
      ),
    );
  }

  TextStyle _labelStyle() => const TextStyle(fontWeight: FontWeight.bold);
}
