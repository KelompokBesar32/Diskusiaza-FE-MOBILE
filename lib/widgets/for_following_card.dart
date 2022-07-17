import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/button_primary.dart';
import 'package:flutter/material.dart';

class ForFollowingCard extends StatelessWidget {
  const ForFollowingCard({
    Key? key,
    required this.pictUrl,
    required this.name,
    required this.email,
  }) : super(key: key);

  final String pictUrl;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(30),
                    child: Image.asset(
                      pictUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: poppinsRegular(13, Colors.black),
              ),
              Text(
                email,
                style: poppinsRegular(10, Colors.black54),
              ),
              const SizedBox(height: 10),
              ButtonPrimary(
                width: 70,
                height: 40,
                label: 'Ikuti',
                onCreate: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
