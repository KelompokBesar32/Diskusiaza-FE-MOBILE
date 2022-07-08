import 'package:flutter/material.dart';

class ThreadCard extends StatelessWidget {
  final int id;
  final String judul;
  final String isi;
  final int dilihat;
  final String kategoriName;
  final int totalLike;
  const ThreadCard({
    Key? key,
    required this.id,
    required this.judul,
    required this.isi,
    required this.dilihat,
    required this.kategoriName,
    required this.totalLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    return SizedBox(
      height: height * 0.25,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(judul),
              Text(
                isi,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 5,
              ),
              Text(dilihat.toString()),
              Text(totalLike.toString()),
              Text(kategoriName),
            ],
          ),
        ),
      ),
    );
  }
}
