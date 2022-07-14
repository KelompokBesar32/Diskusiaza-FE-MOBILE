import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class ButtonSecondary extends StatelessWidget {
  const ButtonSecondary({
    Key? key,
    required this.title,
    required this.onCreate,
    this.icon,
  }) : super(key: key);

  final String title;
  final Function() onCreate;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(
              color: infoColor,
              width: 1,
            ),
          ),
        ),
      ),
      onPressed: onCreate,
      child: (icon == null)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: poppinsRegular(14, infoColor),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon),
                Text(
                  title,
                  style: poppinsRegular(14, infoColor),
                ),
              ],
            ),
    );
  }
}
