import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class ButtonTertiary extends StatelessWidget {
  const ButtonTertiary({
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
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
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
                  style: poppinsRegular(14, Colors.black),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: Colors.black,
                  size: 20,
                ),
                Text(
                  title,
                  style: poppinsRegular(14, Colors.black),
                ),
              ],
            ),
    );
  }
}
