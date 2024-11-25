import 'package:edusphere_mobile/core/widgets/file_uploader_feild.dart';
import 'package:edusphere_mobile/shared/Apis/apis_req_endpoint.dart';
import 'package:edusphere_mobile/shared/providers/Auth/teacher_auth_provider.dart';
import 'package:edusphere_mobile/shared/providers/upload_data_provider/student_assignment_provider.dart';
import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as p;

class NotesUploaderForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  NotesUploaderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TeacherAuthProvider>(
      builder: (_, value, __) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubjectCodeEntry(controller: value.subjectCodeController),
              NotesUploaderFeild(controller: value.filesController),
              UploadNotesButton(onPressed: () async {
                final tProvider =
                    Provider.of<TeacherAuthProvider>(context, listen: false);
                final provider =
                    Provider.of<UploadDataProvider>(context, listen: false);
                await provider.uploadDataWithHeaders(
                    context,
                    tProvider.subjectCode,
                    tProvider.tl.email,
                    tProvider.tl.name,
                    ApisReqEndpoint.uploadTeacherNotes());
              }),
            ],
          ),
        );
      },
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
      onPressed: () async {
        final provider =
            Provider.of<UploadDataProvider>(context, listen: false);
        await provider.pickPdfFile();
        if (provider.currentFile != null) {
          Provider.of<TeacherAuthProvider>(context, listen: false)
              .filesController
              .text = p.basename(provider.currentFile!.path);
        }
      },
    );
  }
}
