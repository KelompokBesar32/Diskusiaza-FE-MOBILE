import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          ShimmerLoad(width: 300, height: 500, radius: 45),
          SearchInput(
              // height: height,
              // width: width,
              // contoller: genderController,
              ),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(
        isHome: false,
        isExplore: true,
        isTrending: false,
        isAccount: false,
      ),
    );
  }
}
