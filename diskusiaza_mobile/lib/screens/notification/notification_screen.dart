import 'package:diskusiaza_mobile/models/notif.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/notification_list_tile.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;
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
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
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
              return const SizedBox(height: 8);
            },
            itemCount: notifList.length,
          ),
        ),
      ),
    );
  }
}
