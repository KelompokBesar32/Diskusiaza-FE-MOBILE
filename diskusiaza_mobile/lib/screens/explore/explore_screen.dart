import 'package:diskusiaza_mobile/models/followers.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:diskusiaza_mobile/widgets/button_primary.dart';
import 'package:diskusiaza_mobile/widgets/for_following_card.dart';
import 'package:diskusiaza_mobile/widgets/search_field.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<CheckBoxList> checkBoxList = CheckBoxList.getList();

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxList[index].isCheck = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2.0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 330,
                    child: SearchField(
                      hint: 'Cari di Diskusiaza',
                      icon: Icons.search,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Divider(
              height: 2,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Apa yang anda ingin lihat',
                style: poppinsRegular(16, Colors.black),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    dense: true,
                    title: Text(
                      checkBoxList[index].title,
                      style: poppinsLight(
                        14,
                        infoColor,
                      ),
                    ),
                    secondary: const Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: checkBoxList[index].isCheck,
                    onChanged: (val) {
                      itemChange(val!, index);
                    },
                  );
                },
                itemCount: checkBoxList.length,
              ),
            ),
            const Divider(
              height: 2,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Untuk diikuti',
                style: poppinsRegular(16, Colors.black),
              ),
            ),
            SizedBox(
              height: 192,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ForFollowingCard(
                    pictUrl: followersList[index].pictUrl,
                    name: followersList[index].name,
                    email: followersList[index].email,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 4);
                },
                itemCount: followersList.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Tampilkan lebih banyak',
                style: poppinsLight(14, infoColor),
              ),
            ),
          ],
        ),
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

class CheckBoxList {
  int id;
  String title;
  bool isCheck;

  CheckBoxList({
    required this.id,
    required this.title,
    required this.isCheck,
  });

  static List<CheckBoxList> getList() {
    return <CheckBoxList>[
      CheckBoxList(
        id: 1,
        title: 'Hot Threads',
        isCheck: false,
      ),
      CheckBoxList(
        id: 2,
        title: 'Rekomendasi Threads',
        isCheck: false,
      ),
      CheckBoxList(
        id: 3,
        title: 'Threads Terbaru Dalam Minggu ini',
        isCheck: false,
      ),
      CheckBoxList(
        id: 4,
        title: 'Content Creator Ngetop',
        isCheck: false,
      ),
    ];
  }
}
