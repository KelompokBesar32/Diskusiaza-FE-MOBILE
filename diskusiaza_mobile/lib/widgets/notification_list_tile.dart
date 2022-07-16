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
      leading: Image.asset(
        pictUrl,
        fit: BoxFit.cover,
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.more_horiz),
      ),
      title: Row(
        children: [
          Text(
            grupName,
            style: poppinsLight(
              16,
              Colors.black54,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.noise_control_off_sharp,
            size: 14,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            'Dikirikan oleh $pengirim',
            style: poppinsLight(
              16,
              Colors.black54,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            waktu,
            style: poppinsLight(
              16,
              Colors.black54,
            ),
          ),
        ],
      ),
      subtitle: Text(
        desc,
        style: poppinsRegular(
          18,
          Colors.black,
        ),
      ),
    );
  }
}
