import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key? key,
    required this.width,
    this.height,
    required this.label,
    required this.onCreate,
  }) : super(key: key);

  final double width;
  final double? height;
  final String label;
  final Function() onCreate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: (height == null) ? 46 : height,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(infoColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(
                color: Colors.black38,
                width: 0.8,
              ),
            ),
          ),
        ),
        onPressed: onCreate,
        child: Text(
          label,
          style: poppinsMedium(16, Colors.white),
        ),
      ),
    );
  }
}
