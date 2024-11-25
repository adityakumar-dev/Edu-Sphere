import 'package:edusphere_mobile/core/widgets/file_uploader_feild.dart';
import 'package:edusphere_mobile/shared/Apis/apis_req_endpoint.dart';
import 'package:edusphere_mobile/shared/providers/upload_data_provider/student_assignment_provider.dart';
import 'package:edusphere_mobile/shared/providers/Auth/student_auth_provider.dart';
import 'package:edusphere_mobile/shared/widgets/text_entry.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as p;

import 'package:provider/provider.dart';

class AssignmentUploaderForm extends StatelessWidget {
  AssignmentUploaderForm({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void verifyUploadForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<StudentAuthProvider>(context, listen: false);
      final assProivder =
          Provider.of<UploadDataProvider>(context, listen: false);
      await assProivder.uploadDataWithHeaders(
          context,
          provider.subjectCode,
          provider.stl.email,
          provider.stl.name,
          ApisReqEndpoint.uploadStudentAssignment());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentAuthProvider>(
      builder: (_, value, __) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          value.nameController.text = value.stl.rollNumber;
        });
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StudentRollNumberEntry(controller: value.nameController),
              SubjectCodeEntry(controller: value.subjectCodeController),
              AssignmentFilePicker(controller: value.asssignmnetFileController),
              UploadAssignmentButton(
                  onPressed: () => verifyUploadForm(context)),
            ],
          ),
        );
      },
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
        readOnly: true,
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
      onPressed: () async {
        final provider =
            Provider.of<UploadDataProvider>(context, listen: false);
        await provider.pickPdfFile();
        if (provider.currentFile == null) {
          Fluttertoast.showToast(
              msg: provider.errorMessage ?? "Please choose the pdf file",
              backgroundColor: Colors.red);
        } else {
          Provider.of<StudentAuthProvider>(context, listen: false)
              .asssignmnetFileController
              .text = p.basename(provider.currentFile!.path);
        }
      },
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
