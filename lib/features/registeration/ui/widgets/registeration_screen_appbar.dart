import 'package:edusphere_mobile/core/widgets/submit_account_details_button.dart';
import 'package:edusphere_mobile/shared/widgets/top_appbar.dart';
import 'package:flutter/material.dart';

class RegisterationScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  const RegisterationScreenAppbar({super.key, this.onSubmit});

  final void Function()? onSubmit; 

  @override
  Widget build(BuildContext context) {
    return TopAppbar(
      title: const Text("Register"),
      leading: const CloseButton(),
      actions: [SubmitAccountDetailsButton(onPressed: onSubmit)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
