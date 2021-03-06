import 'package:diskusiaza_mobile/models/notif.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/button_secondary.dart';
import 'package:diskusiaza_mobile/widgets/notification_list_tile.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: poppinsRegular(18, Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
              width: 210,
              child: ButtonSecondary(
                title: 'Tandai sudah dibaca',
                icon: Icons.done_all,
                onCreate: () {},
              ),
            ),
            SizedBox(
              height: height,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return NotificationListTile(
                    grupName: notifList[index].grupName!,
                    pengirim: notifList[index].pengirim!,
                    waktu: notifList[index].waktu!,
                    desc: notifList[index].desc!,
                    pictUrl: notifList[index].pictUrl!,
                    onTap: () {},
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: notifList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
