import 'package:diskusiaza_mobile/screens/profile/profile_screen_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
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
      Provider.of<ProfileScreenViewModel>(context, listen: false)
          .getDataProfile(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    return Scaffold(
      body: Consumer<ProfileScreenViewModel>(
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
            child: SingleChildScrollView(
              child: Column(
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
                        const Positioned(
                          left: 12,
                          top: 12,
                          child: CircleAvatar(
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        const Positioned(
                          right: 12,
                          top: 12,
                          child: CircleAvatar(
                            child: Icon(Icons.arrow_back),
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
                                  'assets/images/fotoProfile.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 12,
                          bottom: 0,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/profileEdit');
                            },
                            child: const Text('Edit Profil'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '${value.dataProfile!.firstname} ${value.dataProfile!.lastname}',
                    ),
                    subtitle: Text(
                      '${value.dataProfile!.email}',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: const [
                        Text('118'),
                        SizedBox(width: 5),
                        Text('Mengikuti'),
                        SizedBox(width: 30),
                        Text('69'),
                        SizedBox(width: 5),
                        Text('Pengikut'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            child: TabBar(
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
                          SizedBox(
                            height: height,
                            child: const TabBarView(
                              children: [
                                Center(
                                  child: Text('Thread'),
                                ),
                                Center(
                                  child: Text('Balasan'),
                                ),
                                Center(
                                  child: Text('Media'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
