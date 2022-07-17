import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/avatar_pict.dart';
import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:diskusiaza_mobile/widgets/button_secondary.dart';
import 'package:diskusiaza_mobile/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RuangAdminScreen extends StatelessWidget {
  const RuangAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var width = mediaQueryData.size.width;

    final value = Provider.of<ProfileViewModel>(context, listen: false);
    return Scaffold(
      body: SafeArea(
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
                                'assets/images/ruang1.png',
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
                                child: CircleAvatar(
                                  radius: 45,
                                  child: ClipOval(
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(45),
                                      child: Image.asset(
                                        'assets/images/ruang11.png',
                                        fit: BoxFit.cover,
                                      ),
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
                                    title: 'Edit Ruang',
                                    icon: Icons.settings,
                                    onCreate: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Ruang Tunggu Mantan',
                            style: poppinsMedium(
                              16,
                              Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            '@Ruang Tunggu Para Pemain',
                            style: poppinsRegular(
                              14,
                              Colors.black54,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/ruang/kontributor');
                            },
                            child: Row(
                              children: [
                                Text(
                                  '2',
                                  style: poppinsRegular(14, Colors.black),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Kontributor',
                                  style: poppinsRegular(14, Colors.black54),
                                ),
                              ],
                            ),
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
                          'Tentang Kami',
                          style: poppinsMedium(14, Colors.black),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          'Kiriman',
                          style: poppinsMedium(14, Colors.black),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          'Pertanyaan',
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
                const Center(
                  child: Text('Tentang Kami'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          'Dashboard Admin',
                          style: poppinsRegular(14, Colors.black),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(
                          height: 2,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Tayangan',
                                  style: poppinsRegular(14, Colors.black),
                                ),
                                Text(
                                  '0',
                                  style: poppinsRegular(14, Colors.black),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Mengikuti',
                                  style: poppinsRegular(14, Colors.black),
                                ),
                                Text(
                                  '1',
                                  style: poppinsRegular(14, Colors.black),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Dukung Naik',
                                  style: poppinsRegular(14, Colors.black),
                                ),
                                Text(
                                  '0',
                                  style: poppinsRegular(14, Colors.black),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Komentar',
                                  style: poppinsRegular(14, Colors.black),
                                ),
                                Text(
                                  '0',
                                  style: poppinsRegular(14, Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 16, 14, 0),
                        child: Text(
                          '7 Hari Terakhir',
                          style: poppinsRegular(12, Colors.grey),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(
                          height: 2,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15),
                                    ),
                                  ),
                                  builder: (context) {
                                    return Container(
                                      height: 150,
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Undang',
                                            style: poppinsRegular(
                                                16, Colors.black45),
                                          ),
                                          const Divider(
                                            thickness: 2,
                                            height: 2,
                                          ),
                                          Text(
                                            'Pengikut',
                                            style: poppinsRegular(
                                                16, Colors.black),
                                          ),
                                          const Divider(
                                            thickness: 2,
                                            height: 2,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  '/ruang/kontributor');
                                            },
                                            child: Text(
                                              'Kontributor',
                                              style: poppinsRegular(
                                                  16, Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 16,
                                    backgroundColor: backgroundPrimaryColor,
                                    child: Icon(
                                      Icons.person_add,
                                      size: 18,
                                      color: infoColor,
                                    ),
                                  ),
                                  Text(
                                    'Undang',
                                    style: poppinsRegular(14, Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                const CircleAvatar(
                                  radius: 16,
                                  backgroundColor: backgroundPrimaryColor,
                                  child: Icon(
                                    Icons.person,
                                    size: 18,
                                    color: infoColor,
                                  ),
                                ),
                                Text(
                                  'Orang',
                                  style: poppinsRegular(14, Colors.black),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/ruang/antrean');
                              },
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 16,
                                    backgroundColor: backgroundPrimaryColor,
                                    child: Icon(
                                      Icons.alarm_rounded,
                                      size: 18,
                                      color: infoColor,
                                    ),
                                  ),
                                  Text(
                                    'Antrian',
                                    style: poppinsRegular(14, Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                const CircleAvatar(
                                  radius: 16,
                                  backgroundColor: backgroundPrimaryColor,
                                  child: Icon(
                                    Icons.shield_moon,
                                    size: 18,
                                    color: infoColor,
                                  ),
                                ),
                                Text(
                                  'Setelan',
                                  style: poppinsRegular(14, Colors.black),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/ruang/logAdmin');
                              },
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 16,
                                    backgroundColor: backgroundPrimaryColor,
                                    child: Icon(
                                      Icons.more_vert,
                                      size: 18,
                                      color: infoColor,
                                    ),
                                  ),
                                  Text(
                                    'Log Admin',
                                    style: poppinsRegular(14, Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(
                          height: 2,
                          thickness: 2,
                        ),
                      ),
                      ListTile(
                        leading: (value.dataProfile!.foto != null ||
                                value.dataProfile!.foto != "")
                            ? AvatarPict(
                                urlPict: value.dataProfile!.foto!,
                                radiusPict: 20,
                              )
                            : CircleAvatar(
                                radius: 20,
                                child: Text(
                                  '${value.dataProfile!.firstname![0]}${value.dataProfile!.lastname![0]}',
                                  style: poppinsRegular(
                                    28,
                                    Colors.white,
                                  ),
                                ),
                              ),
                        title: const SearchField(hint: 'Kirim Informasi Ruang'),
                        trailing: const Icon(
                          Icons.mail,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text('Pertanyaan'),
                ),
              ],
            ),
          ),
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
