import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:diskusiaza_mobile/widgets/checkerbox_explore.dart';
import 'package:flutter/material.dart';
import 'package:diskusiaza_mobile/widgets/search_input.dart';
import 'package:diskusiaza_mobile/widgets/shimmer.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchInput(),
            Container(),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.all(10),
                                child: Center(
                                  child: Text("Profil $index"),
                                ),
                                color: Colors.blue,
                              )),
                    )
                  ],
                ),
              ),
            ),
            Container(),
            // SearchInput(
            // height: height,
            // width: width,
            // contoller: genderController,
            // ),
            // CheckerBox(),
            // Container(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(
        isHome: false,
        isExplore: true,
        isTrending: false,
        isAccount: false,
      ),
      appBar: AppBar(
        title: Text(
          'Explore',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 4.0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.black,
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
