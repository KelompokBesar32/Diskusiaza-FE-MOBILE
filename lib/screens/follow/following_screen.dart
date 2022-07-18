import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/follow_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          'Pengikut',
          style: poppinsRegular(18, Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProfileViewModel>(
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

            if (value.followersList!.isEmpty) {
              return const Center(
                child: Text('Kosong'),
              );
            }

            return SizedBox(
              height: height,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return FollowListTile(
                    pictUrl: value.followingList![index].foto!,
                    name:
                        ('${value.followingList![index].firstname!} ${value.followersList![index].lastname!}'),
                    email: value.followingList![index].email!,
                    isFollow: false,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: value.followingList!.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
