import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/button_primary.dart';
import 'package:diskusiaza_mobile/widgets/button_secondary.dart';
import 'package:flutter/material.dart';

class FollowListTile extends StatelessWidget {
  const FollowListTile({
    Key? key,
    required this.pictUrl,
    required this.name,
    required this.email,
    required this.isFollow,
  }) : super(key: key);

  final String pictUrl;
  final String name;
  final String email;
  final bool isFollow;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        child: ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(28),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(pictUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      title: Text(
        name,
        style: poppinsRegular(16, Colors.black),
      ),
      subtitle: Text(
        email,
        style: poppinsLight(14, Colors.black54),
      ),
      trailing: (isFollow == true)
          ? SizedBox(
              width: 90,
              child: ButtonSecondary(
                title: 'Mengikuti',
                onCreate: () {},
              ),
            )
          : ButtonPrimary(
              width: 80,
              height: 40,
              label: 'Ikuti',
              onCreate: () {},
            ),
    );
  }
}
