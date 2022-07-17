import 'package:diskusiaza_mobile/models/following.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/follow_list_tile.dart';
import 'package:flutter/material.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Mengikuti',
          style: poppinsRegular(18, Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: height,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return FollowListTile(
                pictUrl: followingList[index].pictUrl,
                name: followingList[index].name,
                email: followingList[index].email,
                isFollow: true,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: followingList.length,
          ),
        ),
      ),
    );
  }
}
