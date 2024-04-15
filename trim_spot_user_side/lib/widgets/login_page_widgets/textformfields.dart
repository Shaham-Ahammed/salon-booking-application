import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/login_screen/controllers.dart';
import 'package:trim_spot_user_side/utils/textformfields.dart';

class UsernNameLoginTextFormField extends StatelessWidget {
  const UsernNameLoginTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validation: (value) {
        if (value == "") {
          return "enter username";
        } else {
          return null;
        }
      },
      controller: loginUsernameController,
      hintText: "Username",
      textInputType: TextInputType.emailAddress,
    );
  }
}

class PasswordLoginTextFormfield extends StatelessWidget {
  const PasswordLoginTextFormfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      validation: (value) {
        if (value == "") {
          return "enter password";
        } else {
          return null;
        }
      },
      controller: loginPasswordController,
      hintText: "Password",
      obscureText: true,
    );
  }
}
