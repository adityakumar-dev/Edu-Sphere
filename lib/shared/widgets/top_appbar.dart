import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopAppbar extends StatelessWidget {
  const TopAppbar({
    super.key,
    this.title,
    this.centerTitle,
    this.leading,
    this.actions,
  });

  final Widget? title, leading;
  final bool? centerTitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      titleSpacing: 0,
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: false,
      titleTextStyle: _titleTextStyle(context),
      systemOverlayStyle: _statusBarDecoration(context),
    );
  }

  TextStyle _titleTextStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: IconTheme.of(context).color,
      fontFamily: "Inter",
      fontSize: 18,
    );
  }

  SystemUiOverlayStyle _statusBarDecoration(BuildContext context) {
    Brightness systemBrightness = Theme.of(context).brightness;

    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: systemBrightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
    );
  }
}
