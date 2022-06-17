import 'package:flutter/material.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.suffix,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool suffix;

  @override
  Widget build(BuildContext context) {
    bool isHidden = false;
    return SizedBox(
      height: 40,
      child: TextFormField(
        autofocus: false,
        controller: controller,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your $hintText");
          }
          return null;
        },
        onSaved: (value) {
          controller.text = value!;
        },
        textInputAction: TextInputAction.done,
        style: poppinsLight(16, Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          hintText: hintText,
          suffixIcon: !suffix
              ? null
              : IconButton(
                  onPressed: () {
                    isHidden = !isHidden;
                  },
                  icon: !isHidden
                      ? const Icon(Icons.remove_red_eye_outlined)
                      : const Icon(
                          Icons.remove_red_eye,
                        ),
                ),
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
      ),
    );
  }
}
