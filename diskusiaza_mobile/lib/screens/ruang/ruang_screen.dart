import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/button_primary.dart';
import 'package:diskusiaza_mobile/widgets/button_secondary.dart';
import 'package:diskusiaza_mobile/widgets/button_tertiary.dart';
import 'package:flutter/material.dart';

class RuangScreen extends StatelessWidget {
  const RuangScreen({Key? key}) : super(key: key);

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
          'Ruang',
          style: poppinsRegular(18, Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonSecondary(
                  title: 'Buat Ruang',
                  icon: Icons.add_circle_outline_outlined,
                  onCreate: () {},
                ),
                const SizedBox(width: 12),
                ButtonSecondary(
                  title: 'Telusuri Urang',
                  icon: Icons.assistant_direction_outlined,
                  onCreate: () {},
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                height: 2,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ruang anda',
                  style: poppinsRegular(16, Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/user2.jpg'),
                    dense: true,
                    title: Text(
                      'Ruang tunggu Mantan',
                      style: poppinsRegular(
                        14,
                        Colors.black,
                      ),
                    ),
                    trailing: SizedBox(
                      height: 35,
                      width: 90,
                      child: ButtonTertiary(
                        title: 'Admin',
                        icon: Icons.shield,
                        onCreate: () {},
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/user1.jpg'),
                    dense: true,
                    title: Text(
                      'Ruang Jomblo',
                      style: poppinsRegular(
                        14,
                        Colors.black,
                      ),
                    ),
                    trailing: SizedBox(
                      height: 35,
                      width: 120,
                      child: ButtonTertiary(
                        title: 'Moderator',
                        icon: Icons.shield_moon,
                        onCreate: () {},
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/user4.jpg'),
                    dense: true,
                    title: Text(
                      'Akane Mizuno',
                      style: poppinsRegular(
                        14,
                        Colors.black,
                      ),
                    ),
                    trailing: SizedBox(
                      height: 35,
                      width: 105,
                      child: ButtonTertiary(
                        title: 'Member',
                        icon: Icons.shield_outlined,
                        onCreate: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                height: 2,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Temukan Ruang',
                  style: poppinsRegular(16, Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 220,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset('assets/images/user2.jpg'),
                    dense: true,
                    title: Text(
                      'Ruang tunggu Mantan',
                      style: poppinsRegular(
                        14,
                        Colors.black,
                      ),
                    ),
                    trailing: ButtonPrimary(
                      width: 90,
                      height: 38,
                      label: 'Ikuti',
                      onCreate: () {},
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
