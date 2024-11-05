import 'package:edusphere_mobile/core/widgets/canvas_banner.dart';
import 'package:edusphere_mobile/features/assignment/ui/widgets/assignment_uploader_form.dart';
import 'package:flutter/material.dart';

class AssignementUploaderCanvas extends StatelessWidget {
  const AssignementUploaderCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssignmentUploaderBanner(),
            AssignmentUploaderForm(),
          ],
        ),
      ),
    );
  }
}

class AssignmentUploaderBanner extends StatelessWidget {
  const AssignmentUploaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const CanvasBanner(
      headingText: "Upload Your Assignment",
      subHeadingText: "Enter required details below.",
    );
  }
}
