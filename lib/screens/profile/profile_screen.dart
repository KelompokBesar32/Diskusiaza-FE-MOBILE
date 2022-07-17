import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/services/auth_services.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/avatar_pict.dart';
import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:diskusiaza_mobile/widgets/list_tile_leading_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileViewModel>(context, listen: false)
          .getDataProfile(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    return Scaffold(
      body: Consumer<ProfileViewModel>(
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

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.3,
                    width: width,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          !(value.dataProfile!.foto != null ||
                                  value.dataProfile!.foto != "")
                              ? AvatarPict(
                                  urlPict: value.dataProfile!.foto!,
                                  radiusPict: 45,
                                )
                              : CircleAvatar(
                                  radius: 45,
                                  child: Text(
                                    '${value.dataProfile!.firstname![0]}${value.dataProfile!.lastname![0]}',
                                    style: poppinsRegular(
                                      28,
                                      Colors.white,
                                    ),
                                  ),
                                ),
                          Text(
                            '${value.dataProfile!.firstname} ${value.dataProfile!.lastname}',
                            style: poppinsMedium(
                              16,
                              Colors.black,
                            ),
                          ),
                          Text(
                            '${value.dataProfile!.email}',
                            style: poppinsRegular(
                              14,
                              Colors.black54,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/following');
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      '118',
                                      style: poppinsRegular(14, Colors.black),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Mengikuti',
                                      style: poppinsRegular(14, Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/followers');
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(width: 30),
                                    Text(
                                      '69',
                                      style: poppinsRegular(14, Colors.black),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Pengikut',
                                      style: poppinsRegular(14, Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTileLeadingTitle(
                    onCreate: () {
                      Navigator.of(context).pushNamed('/profileDetail');
                    },
                    icons: Icons.person,
                    title: 'Profile',
                  ),
                  ListTileLeadingTitle(
                    onCreate: () {
                      Navigator.pushNamed(context, '/bookmarks');
                    },
                    icons: Icons.bookmark,
                    title: 'Bookmarks',
                  ),
                  ListTileLeadingTitle(
                    onCreate: () {},
                    icons: Icons.notes_rounded,
                    title: 'Jawab',
                  ),
                  ListTileLeadingTitle(
                    onCreate: () {
                      Navigator.pushNamed(context, '/ruang');
                    },
                    icons: Icons.groups_rounded,
                    title: 'Ruang',
                  ),
                  ListTileLeadingTitle(
                    onCreate: () {
                      Navigator.pushNamed(context, '/kebijakan');
                    },
                    icons: Icons.privacy_tip_sharp,
                    title: 'Kebijakan Privasi',
                  ),
                  ListTileLeadingTitle(
                    onCreate: () {},
                    icons: Icons.star,
                    title: 'Rate Us',
                  ),
                  ListTileLeadingTitle(
                    onCreate: () {
                      Provider.of<AuthServices>(context, listen: false)
                          .getLogout(context);
                      Provider.of<AuthServices>(context, listen: false)
                          .checkRememberMe();
                    },
                    icons: Icons.next_plan_outlined,
                    title: 'Keluar',
                  ),
                ],
              ),
            ),
          );
        },
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
