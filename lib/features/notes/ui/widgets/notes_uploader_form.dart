import 'package:edusphere_mobile/core/widgets/file_uploader_feild.dart';
import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final TextEditingController _subjectCode = TextEditingController();
final TextEditingController _notesFile = TextEditingController();

class NotesUploaderForm extends StatelessWidget {
  const NotesUploaderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SubjectCodeEntry(controller: _subjectCode),
          NotesUploaderFeild(controller: _notesFile),
          UploadNotesButton(onPressed: () {}),
        ],
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
        controller: controller,
        textCapitalization: TextCapitalization.characters,
      ),
    );
  }
}

class UploadNotesButton extends StatelessWidget {
  const UploadNotesButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: 400,
      child: FilledButton(
        onPressed: onPressed,
        child: Text("Upload Notes", style: _labelStyle()),
      ),
    );
  }

  TextStyle _labelStyle() => const TextStyle(fontWeight: FontWeight.bold);
}

class NotesUploaderFeild extends StatelessWidget {
  const NotesUploaderFeild({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return FileUploaderFeild(
      labelText: "Notes File",
      controller: controller,
      onPressed: () {},
    );
  }
}
