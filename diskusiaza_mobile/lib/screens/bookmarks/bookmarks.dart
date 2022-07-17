import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmarks',
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
      body: Center(
        child: Image.asset(
          'assets/images/pengembangan.png',
          height: 275,
        ),
      ),
      bottomNavigationBar: const BottomNavbar(
        isHome: false,
        isExplore: false,
        isTrending: false,
        isAccount: false,
      ),
    );
  }
}
