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
  bool isFollow = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileViewModel>(context, listen: false)
          .getDataProfile(context);
      Provider.of<ProfileViewModel>(context, listen: false)
          .getFollowers(context);
      Provider.of<ProfileViewModel>(context, listen: false)
          .getFollowing(context);
      Provider.of<HomeViewModel>(context, listen: false).getAllThread(context);

      Provider.of<HomeViewModel>(context, listen: false)
          .checkUserFollow(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    final manager = Provider.of<HomeViewModel>(context, listen: false);

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
            onPressed: () {
              Navigator.pushNamed(context, '/notification');
            },
          ),
          IconButton(
            icon: const Icon(Icons.mail),
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/message');
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<HomeViewModel>(context, listen: false)
              .getAllThread(context);
        },
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
                    height: height - 135,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final managerUser = Provider.of<ProfileViewModel>(
                            context,
                            listen: false);
                        for (var map in managerUser.followingList!) {
                          if (map.id == value.allThreadList[index].userId) {
                            isFollow = true;
                          } else {
                            isFollow = false;
                          }
                        }

                        return GestureDetector(
                          onTap: () {
                            manager.getThreadById(
                                value.allThreadList[index].id!, context);

                            Navigator.push(
                              context,
                              PageTransition(
                                child: DetailScreen(
                                  id: value.allThreadList[index].id!,
                                  userId: value.allThreadList[index].userId!,
                                  index: index,
                                  isUser: false,
                                  isTrending: false,
                                ),
                                type: PageTransitionType.fade,
                                inheritTheme: true,
                                ctx: context,
                              ),
                            );
                          },
                          child: ThreadCard(
                            index: index,
                            id: value.allThreadList[index].id!,
                            userId: value.allThreadList[index].userId!,
                            judul: value.allThreadList[index].judul!,
                            isi: value.allThreadList[index].isi!,
                            file: value.allThreadList[index].file!,
                            dilihat: value.allThreadList[index].dilihat!,
                            kategoriName:
                                value.allThreadList[index].kategoriName!,
                            authorName: value.allThreadList[index].authorName!,
                            totalLike: value.allThreadList[index].totalLike!,
                            isLike: value.allThreadList[index].isLike!,
                            isFollow:
                                value.allThreadList[index].isFollow ?? false,
                            width: width,
                            isTrending: false,
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
