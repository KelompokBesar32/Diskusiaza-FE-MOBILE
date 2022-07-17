import 'package:diskusiaza_mobile/screens/jawab/pertanyaan_tab_screen.dart';
import 'package:diskusiaza_mobile/screens/jawab/terjawab_tab_screen.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:flutter/material.dart';

class JawabScreen extends StatelessWidget {
  const JawabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jawab',
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
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                labelStyle: poppinsRegular(18, Colors.black),
                tabs: [
                  Tab(
                    icon: Text(
                      'Pertanyaan',
                      style: poppinsMedium(14, Colors.black),
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Terjawab',
                      style: poppinsMedium(14, Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width,
                height: height,
                child: const TabBarView(
                  children: [
                    PertanyaanTabScreen(),
                    TerjawabTabScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
