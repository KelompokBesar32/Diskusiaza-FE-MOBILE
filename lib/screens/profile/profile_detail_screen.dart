import 'package:diskusiaza_mobile/screens/detail/detail_screen.dart';
import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/avatar_pict.dart';
import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:diskusiaza_mobile/widgets/button_secondary.dart';
import 'package:diskusiaza_mobile/widgets/thread_card.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<ProfileViewModel>(context, listen: false)
          .getDataProfile(context);
      await Provider.of<ProfileViewModel>(context, listen: false)
          .getThreadByUser(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<ProfileViewModel>(context, listen: false)
              .getDataProfile(context);
          await Provider.of<ProfileViewModel>(context, listen: false)
              .getThreadByUser(context);
        },
        child: Consumer<ProfileViewModel>(
          builder: (context, manager, child) {
            if (manager.dataState == DataState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (manager.dataState == DataState.error) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }

            return SafeArea(
              child: DefaultTabController(
                length: 3,
                child: NestedScrollView(
                  headerSliverBuilder: (context, value) {
                    return [
                      SliverAppBar(
                        backgroundColor: Colors.white,
                        automaticallyImplyLeading: false,
                        floating: true,
                        pinned: true,
                        expandedHeight: 400,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.pin,
                          background: Column(
                            children: [
                              SizedBox(
                                height: 250,
                                width: width,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/fotoSampul.jpg',
                                      height: 200,
                                      width: width,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      left: 12,
                                      top: 12,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.black45,
                                          child: Icon(Icons.arrow_back),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      right: 12,
                                      top: 12,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black45,
                                        child: Icon(Icons.more_vert),
                                      ),
                                    ),
                                    Positioned(
                                      left: 12,
                                      bottom: 0,
                                      child: (manager.dataProfile!.foto !=
                                                  null &&
                                              manager.dataProfile!.foto != "")
                                          ? AvatarPict(
                                              urlPict:
                                                  manager.dataProfile!.foto!,
                                              radiusPict: 45,
                                            )
                                          : CircleAvatar(
                                              radius: 45,
                                              child: Text(
                                                '${manager.dataProfile!.firstname![0]} ${manager.dataProfile!.lastname![0]}',
                                                style: poppinsRegular(
                                                  28,
                                                  Colors.white,
                                                ),
                                              ),
                                            ),
                                    ),
                                    Positioned(
                                      right: 12,
                                      bottom: 0,
                                      child: SizedBox(
                                        height: 40,
                                        child: ButtonSecondary(
                                          title: 'Edit Profil',
                                          icon: Icons.settings,
                                          onCreate: () {
                                            Navigator.pushNamed(
                                                context, '/profileEdit');
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '${manager.dataProfile!.firstname} ${manager.dataProfile!.lastname}',
                                  style: poppinsMedium(
                                    16,
                                    Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  '${manager.dataProfile!.email}',
                                  style: poppinsRegular(
                                    14,
                                    Colors.black54,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/following');
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            manager.dataProfile!.totalFollowed
                                                .toString(),
                                            style: poppinsRegular(
                                                14, Colors.black),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            'Mengikuti',
                                            style: poppinsRegular(
                                                14, Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/followers');
                                      },
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 30),
                                          Text(
                                            manager.dataProfile!.totalFollowers
                                                .toString(),
                                            style: poppinsRegular(
                                                14, Colors.black),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            'Pengikut',
                                            style: poppinsRegular(
                                                14, Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        bottom: TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.blue,
                          labelStyle: poppinsRegular(18, Colors.black),
                          tabs: [
                            Tab(
                              icon: Text(
                                'Threads',
                                style: poppinsMedium(14, Colors.black),
                              ),
                            ),
                            Tab(
                              icon: Text(
                                'Balasan',
                                style: poppinsMedium(14, Colors.black),
                              ),
                            ),
                            Tab(
                              icon: Text(
                                'Media',
                                style: poppinsMedium(14, Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer<ProfileViewModel>(
                            builder: (context, value, child) {
                              if (value.dataState == DataState.loading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              if (value.dataState == DataState.error) {
                                return const Center(
                                  child: Text('Something went wrong'),
                                );
                              }

                              if (value.allUserThreadList.isEmpty) {
                                return const Center(
                                  child: Text('Belum ada kiriman'),
                                );
                              }

                              return SizedBox(
                                height: height - 80,
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Provider.of<HomeViewModel>(context,
                                                listen: false)
                                            .getThreadById(
                                          value.allUserThreadList[index].id!,
                                          context,
                                        );
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            child: DetailScreen(
                                              id: value
                                                  .allUserThreadList[index].id!,
                                              userId: value
                                                  .allUserThreadList[index]
                                                  .userId!,
                                              index: index,
                                              isUser: false,
                                            ),
                                            type: PageTransitionType.fade,
                                            inheritTheme: true,
                                            ctx: context,
                                          ),
                                        );
                                      },
                                      onLongPress: () {},
                                      child: ThreadCard(
                                        index: index,
                                        id: value.allUserThreadList[index].id!,
                                        userId: value
                                            .allUserThreadList[index].userId!,
                                        judul: value
                                            .allUserThreadList[index].judul!,
                                        isi:
                                            value.allUserThreadList[index].isi!,
                                        file: value
                                            .allUserThreadList[index].file!,
                                        dilihat: value
                                            .allUserThreadList[index].dilihat!,
                                        kategoriName: value
                                            .allUserThreadList[index]
                                            .kategoriName!,
                                        authorName: value
                                            .allUserThreadList[index]
                                            .authorName!,
                                        totalLike: value
                                            .allUserThreadList[index]
                                            .totalLike!,
                                        isLike: value
                                            .allUserThreadList[index].isLike!,
                                        width: width,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 4.0);
                                  },
                                  itemCount: value.allUserThreadList.length,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const Center(
                        child: Text('Balasan'),
                      ),
                      const Center(
                        child: Text('Media'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavbar(
        isHome: false,
        isExplore: false,
        isTrending: false,
        isAccount: true,
      ),
    );
  }
}
