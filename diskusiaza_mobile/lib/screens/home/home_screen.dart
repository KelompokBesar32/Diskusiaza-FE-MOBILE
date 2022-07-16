import 'package:diskusiaza_mobile/screens/detail/detail_screen.dart';
import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:diskusiaza_mobile/widgets/post_thread_fab.dart';
import 'package:diskusiaza_mobile/widgets/shimmer.dart';
import 'package:diskusiaza_mobile/widgets/thread_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileViewModel>(context, listen: false)
          .getDataProfile(context);
      Provider.of<HomeViewModel>(context, listen: false).getAllThread(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diskusiaza',
          style: poppinsBold(18, infoColor),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mail),
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/notification');
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<HomeViewModel>(context, listen: false)
              .getAllThread(context);
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<HomeViewModel>(
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
                                return ShimmerCard(
                                    width: width, height: 200, radius: 15);
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 4,
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
                      height: height - 80,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: DetailScreen(
                                      id: value.allThreadList[index].id!),
                                  type: PageTransitionType.fade,
                                  inheritTheme: true,
                                  ctx: context,
                                ),
                              );
                            },
                            child: ThreadCard(
                              index: index,
                              id: value.allThreadList[index].id!,
                              judul: value.allThreadList[index].judul!,
                              isi: value.allThreadList[index].isi!,
                              dilihat: value.allThreadList[index].dilihat!,
                              kategoriName:
                                  value.allThreadList[index].kategoriName!,
                              authorName:
                                  value.allThreadList[index].authorName!,
                              totalLike: value.allThreadList[index].totalLike!,
                              isLike: value.allThreadList[index].isLike!,
                              isUser: false,
                              width: width,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 4.0);
                        },
                        itemCount: value.allThreadList.length,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: PostThreadFAB(width: width, isUser: false),
      bottomNavigationBar: const BottomNavbar(
        isHome: true,
        isExplore: false,
        isTrending: false,
        isAccount: false,
      ),
    );
  }
}
