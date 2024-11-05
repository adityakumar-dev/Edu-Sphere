import 'package:flutter/material.dart';

class CanvasBanner extends StatelessWidget {
  const CanvasBanner({
    super.key,
    required this.headingText,
    this.subHeadingText = '',
    this.icon = const SizedBox(height: 0),
  });

  final String headingText;
  final String subHeadingText;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          icon,
          Text(headingText, style: _headingStyle()),
          Text(subHeadingText),
        ],
      ),
    );
  }

  TextStyle _headingStyle() => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      );
}
