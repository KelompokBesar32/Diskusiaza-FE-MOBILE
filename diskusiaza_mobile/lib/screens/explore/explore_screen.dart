import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:diskusiaza_mobile/widgets/search_input.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SearchInput(
                // height: height,
                // width: width,
                // contoller: genderController,
                ),

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
        title: const Text(
          'Explore',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 4.0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.black,
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
