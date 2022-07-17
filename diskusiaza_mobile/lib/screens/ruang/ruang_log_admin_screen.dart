import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class LogAdminScreen extends StatelessWidget {
  const LogAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: infoColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Log Admin',
          style: poppinsRegular(18, Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Icon ruang diperbaharui oleh ',
                      style: poppinsRegular(16, Colors.black),
                    ),
                    Text(
                      'Zeronime Point4',
                      style: poppinsRegular(16, infoColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#20220709',
                      style: poppinsRegular(11, Colors.black54),
                    ),
                    Icon(
                      Icons.noise_control_off_sharp,
                      size: 8,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      'Terima Kasih',
                      style: poppinsRegular(11, Colors.black54),
                    ),
                    Icon(
                      Icons.noise_control_off_sharp,
                      size: 8,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      'Laporkan',
                      style: poppinsRegular(11, Colors.black54),
                    ),
                    Icon(
                      Icons.noise_control_off_sharp,
                      size: 8,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      '26 Mei 2022',
                      style: poppinsRegular(11, Colors.black54),
                    ),
                    Icon(
                      Icons.noise_control_off_sharp,
                      size: 8,
                      color: Colors.grey.shade400,
                    ),
                    Text(
                      '14.07.14',
                      style: poppinsRegular(11, Colors.black54),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    height: 2,
                    thickness: 2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
