import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class KebijakanScreen extends StatelessWidget {
  const KebijakanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Kebijakan Privasi',
          style: poppinsRegular(18, Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.face_retouching_natural_sharp),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/support');
            },
          ),
        ],
        backgroundColor: infoColor,
        elevation: 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Melalui kebijakan privasi (“kebijakan”) ini, Aplikasi Diskusiaza adalah aplikasi berupa forum diskusi group yang digunakan oleh user yang ingin menanyakan sesuatu yang belum dia ketahui. Di Aplikasi ini user dapat mendapatkan berbagai informasi yang ada didunia ini. ',
              style: poppinsRegular(14, Colors.black),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Text(
              'Kebijakan ini menjelaskan  bahwa Diskusiaza atau kami mengumpulkan,memproses,mengungkapkan data pribadi anda melalui penggunaan aplikasi dan situs web Diskusiaza,fitur-fitur dan layanan lainnya secara umum (“Layanan”).',
              style: poppinsRegular(14, Colors.black),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Text(
              'Kebijakan ini menjelaskan dan memberikan landasan dasar mengenai bagaimana kami mengumpulkan,menggunakan,memproses,dan mengungkapkan data pribadi anda melalui penggunaan layanan. Mohon membaca kebijakan privasi kami dengan seksama dan dengan mengunjungi situs kami, Anda telah menerima dan menyetujui pendekatan dan cara-cara yang digambarkan dalam kebijakan privasi ini.',
              style: poppinsRegular(14, Colors.black),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
