import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/button_primary.dart';
import 'package:flutter/material.dart';

class PertanyaanTabScreen extends StatelessWidget {
  const PertanyaanTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var width = mediaQueryData.size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              'Pertanyaan untuk anda',
              style: poppinsLight(16, Colors.black),
            ),
          ),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            height: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.8,
                      child: Positioned(
                        top: 0,
                        left: 0,
                        child: Text(
                          'Hal apa yang biasa kamu lakukan kalo keinget mantan?',
                          style: poppinsMedium(16, Colors.black),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.close,
                      size: 18,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '2 Jawaban',
                      style: poppinsRegular(14, Colors.black),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.noise_control_off_sharp,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Terakhir Diikuti 3 jam',
                      style: poppinsRegular(14, Colors.black45),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.mode_edit_outline_outlined,
                          size: 16,
                          color: infoColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Jawab',
                          style: poppinsRegular(14, Colors.black),
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.online_prediction,
                          size: 16,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Ikuti',
                          style: poppinsRegular(14, Colors.black),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.noise_control_off_sharp,
                          size: 10,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '1',
                          style: poppinsRegular(14, Colors.black),
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.edit_off_outlined,
                          size: 16,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Lewati',
                          style: poppinsRegular(14, Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.download,
                          size: 16,
                          color: Colors.black,
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.forward,
                          size: 16,
                          color: Colors.black,
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.more_horiz,
                          size: 16,
                          color: Colors.black,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ruang untuk anda ikuti',
                style: poppinsRegular(16, Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 280,
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
                  subtitle: Text(
                    'Ruang tunggu untuk para...',
                    style: poppinsRegular(
                      10,
                      Colors.black54,
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Tampilkan lebih banyak',
              style: poppinsLight(14, infoColor),
            ),
          ),
        ],
      ),
    );
  }
}
