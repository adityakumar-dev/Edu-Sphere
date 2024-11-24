import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

loaderDailog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return LoadingAnimationWidget.fourRotatingDots(
          color: Colors.blue, size: 40);
    },
  );
}
