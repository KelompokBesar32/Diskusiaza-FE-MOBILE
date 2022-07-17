import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/button_primary.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

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
          'Support',
          style: poppinsRegular(18, Colors.white),
        ),
        backgroundColor: infoColor,
        elevation: 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hallo, Terima kasih sudah menggunakan aplikasi Diskusiaza. Berikan kritik dan saran atas pengalaman anda menggunakan aplikasi ini',
              style: poppinsRegular(14, Colors.black),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            Text(
              'Silahkan Berkomentar :',
              style: poppinsMedium(14, Colors.black),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              maxLines: 9,
              minLines: 9,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.all(8.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.black38,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.black38,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: infoColor,
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.bottomRight,
              child: ButtonPrimary(
                width: 100,
                height: 40,
                label: 'Kirimkan',
                onCreate: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
