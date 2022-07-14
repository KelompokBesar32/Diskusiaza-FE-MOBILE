import 'package:flutter/material.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';

class InputTextFieldSecondary extends StatelessWidget {
  const InputTextFieldSecondary({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
      onSaved: (value) {
        controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      style: poppinsRegular(16, Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 6),
        hintText: hintText,
        labelText: hintText,
        labelStyle: poppinsRegular(
          18,
          Colors.black54,
        ),
      ),
    );
  }
}
