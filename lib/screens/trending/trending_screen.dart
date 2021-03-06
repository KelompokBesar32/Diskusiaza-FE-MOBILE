import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:diskusiaza_mobile/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:diskusiaza_mobile/screens/detail/detail_screen.dart';
import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/thread_card.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<ProfileViewModel>(context, listen: false)
          .getDataProfile(context);
      await Provider.of<HomeViewModel>(context, listen: false)
          .getTrendingThread(context);
      if (!mounted) return;
      await Provider.of<HomeViewModel>(context, listen: false)
          .checkUserFollowTrending(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trending',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2.0,
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<HomeViewModel>(context, listen: false)
              .getAllThread(context);
        },
        child: SingleChildScrollView(
          child: DefaultTabController(
            length: 3,
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
                        'Minggu ini',
                        style: poppinsMedium(14, Colors.black),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Minggu lalu',
                        style: poppinsMedium(14, Colors.black),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Bulan lalu',
                        style: poppinsMedium(14, Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: width,
                  height: height,
                  child: TabBarView(
                    children: [
                      TrendingThisWeek(height: height - 185, width: width),
                      TrendingThisWeek(height: height - 185, width: width),
                      TrendingThisWeek(height: height - 185, width: width),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavbar(
        isHome: false,
        isExplore: false,
        isTrending: true,
        isAccount: false,
      ),
    );
  }
}

class TrendingThisWeek extends StatelessWidget {
  const TrendingThisWeek({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<HomeViewModel>(
        builder: (context, value, child) {
          if (value.dataState == DataState.loading) {
            return SizedBox(
              height: height,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.grey.shade300,
                child: ListView.separated(
                    padding: const EdgeInsets.all(4),
                    itemBuilder: (context, index) {
                      return ShimmerCard(width: width, height: 200, radius: 15);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: 5),
              ),
            );
          }

          if (value.dataState == DataState.error) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          return SizedBox(
            height: height,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: DetailScreen(
                          id: value.trendingThreadList[index].id!,
                          userId: value.trendingThreadList[index].userId!,
                          index: index,
                          isUser: false,
                          isTrending: true,
                        ),
                        type: PageTransitionType.fade,
                        inheritTheme: true,
                        ctx: context,
                      ),
                    );
                  },
                  child: ThreadCard(
                    index: index,
                    id: value.trendingThreadList[index].id!,
                    userId: value.trendingThreadList[index].userId!,
                    judul: value.trendingThreadList[index].judul!,
                    isi: value.trendingThreadList[index].isi!,
                    file: value.trendingThreadList[index].file!,
                    dilihat: value.trendingThreadList[index].dilihat!,
                    kategoriName: value.trendingThreadList[index].kategoriName!,
                    authorName: value.trendingThreadList[index].authorName!,
                    totalLike: value.trendingThreadList[index].totalLike!,
                    isLike: value.trendingThreadList[index].isLike!,
                    isFollow: value.trendingThreadList[index].isFollow ?? false,
                    width: width,
                    isTrending: true,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 4.0);
              },
              itemCount: (value.allThreadList.length / 3).ceil(),
            ),
          );
        },
      ),
    );
  }
}
