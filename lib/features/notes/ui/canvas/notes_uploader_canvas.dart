import 'package:edusphere_mobile/core/widgets/canvas_banner.dart';
import 'package:edusphere_mobile/features/notes/ui/widgets/notes_uploader_form.dart';
import 'package:flutter/material.dart';

class NotesUploaderCanvas extends StatelessWidget {
  const NotesUploaderCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [NotesUploaderBanner(), NotesUploaderForm()],
      ),
    );
  }
}

class NotesUploaderBanner extends StatelessWidget {
  const NotesUploaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const CanvasBanner(
      headingText: "Upload Your Notes",
      subHeadingText: "Enter required details below.",
    );
  }
}
