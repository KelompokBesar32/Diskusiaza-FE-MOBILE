import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/avatar_pict.dart';
import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:diskusiaza_mobile/widgets/button_secondary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RuangMemberScreen extends StatelessWidget {
  const RuangMemberScreen({Key? key}) : super(key: key);

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
                                'assets/images/ruang3.png',
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
                                        'assets/images/ruang33.png',
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
                                    title: 'Member',
                                    icon: Icons.shield,
                                    onCreate: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Akane Mizuno',
                            style: poppinsMedium(
                              16,
                              Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            '@Waifu',
                            style: poppinsRegular(
                              14,
                              Colors.black54,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GestureDetector(
                            onTap: () {},
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
                  child: ListTile(
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
                    title: SizedBox(
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Kirim Informasi di Ruang',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: infoColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
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
