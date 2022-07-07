import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class ThreadCard extends StatelessWidget {
  final int id;
  final String judul;
  final String isi;
  final int dilihat;
  final String kategoriName;
  final String authorName;
  final int totalLike;
  const ThreadCard({
    Key? key,
    required this.id,
    required this.judul,
    required this.isi,
    required this.dilihat,
    required this.kategoriName,
    required this.authorName,
    required this.totalLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          authorName,
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
                          'Ikuti',
                          style: poppinsRegular(14, infoColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      judul,
                      style: poppinsMedium(14, Colors.black),
                    ),
                    Text(
                      isi,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 5,
                      style: poppinsLight(13, Colors.black),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Row(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.favorite),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          totalLike.toString(),
                          style: poppinsLight(13, Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        const Icon(Icons.remove_red_eye_rounded),
                        const SizedBox(width: 4),
                        Text(
                          dilihat.toString(),
                          style: poppinsLight(13, Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Text(
                  kategoriName,
                  style: poppinsLight(13, Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
