import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trim_spot_barber_side/screens/login%20screen/widgets/textformfields.dart';


class ShopNameTextFormField extends StatelessWidget {
  const ShopNameTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextFormFieldCyan(
      hintText: "Shop Name",
      textInputType: TextInputType.name,
    );
  }
}

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextFormFieldCyan(
      hintText: "Phone",
      textInputType: TextInputType.number,
      maxLenght: 10,
    );
  }
}

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextFormFieldCyan(
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldCyan(
      hintText: "Name",
      textInputType: TextInputType.name,
      filteringTextInputFormatter:
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
    );
  }
}

