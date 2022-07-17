import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final int index;
  final bool isUser;
  const DetailScreen({
    Key? key,
    required this.id,
    required this.index,
    required this.isUser,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<HomeViewModel>(context, listen: false)
          .getThreadById(widget.id, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var width = mediaQueryData.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diskusiaza',
          style: poppinsBold(18, infoColor),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<HomeViewModel>(context, listen: false)
              .getThreadById(widget.id, context);
        },
        child: SingleChildScrollView(
          child: Consumer<HomeViewModel>(
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

              return SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                value.threadDetail!.authorName!,
                                style: poppinsRegular(14, Colors.black),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.noise_control_off_sharp,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Ikuti',
                                style: poppinsRegular(14, infoColor),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            value.threadDetail!.judul!,
                            style: poppinsMedium(14, Colors.black),
                          ),
                          Text(
                            value.threadDetail!.isi!,
                            textAlign: TextAlign.justify,
                            style: poppinsLight(13, Colors.black),
                          ),
                          const SizedBox(height: 12),
                          (value.threadDetail!.file == null ||
                                  value.threadDetail!.file == '')
                              ? const SizedBox()
                              : Image.network(
                                  value.threadDetail!.file!,
                                  width: double.infinity,
                                  height: 200,
                                ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (widget.isUser == true) {
                                    await Provider.of<ProfileViewModel>(context,
                                            listen: false)
                                        .postLikeThread(
                                      value.threadDetail!.id!,
                                      widget.index,
                                      context,
                                    );
                                  } else {
                                    await Provider.of<HomeViewModel>(context,
                                            listen: false)
                                        .postLikeThread(
                                      value.threadDetail!.id!,
                                      widget.index,
                                      context,
                                      true,
                                    );
                                  }
                                },
                                child: value.threadDetail!.isLike!
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.grey,
                                      ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                value.threadDetail!.isLike!
                                    ? (value.threadDetail!.totalLike! + 1)
                                        .toString()
                                    : (value.threadDetail!.totalLike)
                                        .toString(),
                                style: poppinsLight(
                                  13,
                                  Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Row(
                                children: [
                                  const Icon(Icons.remove_red_eye_rounded),
                                  const SizedBox(width: 4),
                                  Text(
                                    value.threadDetail!.dilihat.toString(),
                                    style: poppinsLight(13, Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: SizedBox(
                        width: width * 0.4,
                        child: Text(
                          value.threadDetail!.kategoriName!,
                          textAlign: TextAlign.end,
                          style: poppinsLight(13, Colors.black),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
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
                                height: 225,
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: const [],
                                ),
                              );
                            },
                          );
                        },
                        child: const Icon(Icons.more_horiz),
                      ),
                    ),
                  ],
                ),
              );
            },
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
