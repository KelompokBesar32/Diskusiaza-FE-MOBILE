import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/follow_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          'Mengikuti',
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

            if (value.followingList!.isEmpty) {
              return const Center(
                child: Text('Kosong'),
              );
            }

            return SizedBox(
              height: height,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return FollowListTile(
                    pictUrl: value.followersList![index].foto!,
                    name:
                        ('${value.followersList![index].firstname!} ${value.followersList![index].lastname!}'),
                    email: value.followersList![index].email!,
                    isFollow: true,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: value.followersList!.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
