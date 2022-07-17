import 'package:diskusiaza_mobile/models/followers.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/follow_list_tile.dart';
import 'package:flutter/material.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({Key? key}) : super(key: key);

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
          'Pengikut',
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
                pictUrl: followersList[index].pictUrl,
                name: followersList[index].name,
                email: followersList[index].email,
                isFollow: false,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: followersList.length,
          ),
        ),
      ),
    );
  }
}
