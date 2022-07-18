import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/avatar_pict.dart';
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

  final String? pictUrl;
  final String name;
  final String email;
  final bool isFollow;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: (pictUrl != null && pictUrl != '')
          ? AvatarPict(
              urlPict: pictUrl!,
              radiusPict: 30,
            )
          : CircleAvatar(
              radius: 30,
              child: Text(
                name[0],
                style: poppinsRegular(
                  28,
                  Colors.white,
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
