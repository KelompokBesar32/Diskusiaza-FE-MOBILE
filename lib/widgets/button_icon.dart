import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.outerRadius,
    required this.innerRadius,
    required this.onCreate,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final double outerRadius;
  final double innerRadius;
  final Function() onCreate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCreate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            radius: outerRadius,
            child: Icon(
              icon,
              color: iconColor,
              size: innerRadius,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: poppinsRegular(
              14,
              Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
