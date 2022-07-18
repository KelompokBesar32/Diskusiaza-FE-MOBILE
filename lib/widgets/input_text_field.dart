import 'package:flutter/material.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPhone,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool? isPhone;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      keyboardType: (isPhone != null && isPhone == true)
          ? TextInputType.number
          : TextInputType.text,
      inputFormatters: [
        (isPhone != null && isPhone == true)
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter,
      ],
      validator: validator,
      onSaved: (value) {
        controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      style: poppinsLight(16, Colors.black),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black38,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black38,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: infoColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
