import 'package:edusphere_mobile/core/widgets/canvas_banner.dart';
import 'package:edusphere_mobile/features/greeting/widgets/login_option_buttons.dart';
import 'package:edusphere_mobile/shared/widgets/top_appbar.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WelcomeScreenTopBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[WelcomeScreenBanner(), LoginOptionButtons()],
        ),
      ),
    );
  }
}

class WelcomeScreenTopBar extends StatelessWidget
    implements PreferredSizeWidget {
  const WelcomeScreenTopBar({super.key});

  @override
  Widget build(BuildContext context) => const TopAppbar();

  @override
  Size get preferredSize => const Size.fromHeight(0);
}

class WelcomeScreenBanner extends StatelessWidget {
  const WelcomeScreenBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const CanvasBanner(
      headingText: "Welcome To Edu-Sphere",
      subHeadingText: "Who is going to use this app?",
    );
  }
}
