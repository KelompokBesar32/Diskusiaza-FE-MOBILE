import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    Key? key,
    required this.grupName,
    required this.pengirim,
    required this.waktu,
    required this.desc,
    required this.pictUrl,
    required this.onTap,
  }) : super(key: key);

  final String grupName;
  final String pengirim;
  final String waktu;
  final String desc;
  final String pictUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      dense: true,
      leading: SizedBox(
        height: double.infinity,
        child: Image.asset(
          pictUrl,
          fit: BoxFit.cover,
        ),
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.more_horiz,
          size: 28,
          color: Colors.black,
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            grupName,
            style: poppinsLight(
              14,
              Colors.black54,
            ),
          ),
          Text(
            'Dikirikan oleh $pengirim',
            style: poppinsLight(
              14,
              Colors.black54,
            ),
          ),
          Text(
            waktu,
            style: poppinsLight(
              14,
              Colors.black54,
            ),
          ),
        ],
      ),
      subtitle: Text(
        desc,
        style: poppinsRegular(
          16,
          Colors.black,
        ),
      ),
    );
  }
}
