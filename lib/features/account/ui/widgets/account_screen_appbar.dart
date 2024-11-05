import 'package:edusphere_mobile/core/widgets/submit_account_details_button.dart';
import 'package:edusphere_mobile/shared/widgets/top_appbar.dart';
import 'package:flutter/material.dart';

class AccountScreenAppbar extends StatelessWidget implements PreferredSizeWidget{
  const AccountScreenAppbar({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TopAppbar(
      title: const Text("Account"),
      leading: const CloseButton(),
      actions: [SubmitAccountDetailsButton(onPressed: onPressed)],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}