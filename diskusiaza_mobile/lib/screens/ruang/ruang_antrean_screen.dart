import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class AntreanScreen extends StatelessWidget {
  const AntreanScreen({Key? key}) : super(key: key);

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
          'Antrean',
          style: poppinsRegular(18, Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Antrean',
              style: poppinsRegular(14, Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Kiriman informasi otomatis dalam jangka waktu tertentu',
                style: poppinsRegular(11, Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                'Frekuensi : 4 Kali Sehari',
                style: poppinsRegular(12, Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                'Jam : antara 09.00 dan 20.00',
                style: poppinsRegular(12, Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                'Zona waktu : (GMT - 07.00) Waktu Standar Pasifik',
                style: poppinsRegular(12, Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Divider(
                height: 2,
                thickness: 2,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Image.asset(
                      'assets/images/antrean.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Tidak Ada Antrean Item',
                      style: poppinsMedium(12, Colors.black54),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Belum ada antrean item. Jika ada informasi terbaru dari anteran otomastis akan masuk pada notification',
                      style: poppinsMedium(11, Colors.black38),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
