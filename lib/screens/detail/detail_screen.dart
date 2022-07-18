import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/bottom_navbar.dart';
import 'package:diskusiaza_mobile/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final int userId;
  final int index;
  final bool isUser;
  const DetailScreen({
    Key? key,
    required this.id,
    required this.userId,
    required this.index,
    required this.isUser,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeViewModel>(context, listen: false)
          .getThreadById(widget.id, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var width = mediaQueryData.size.width;

    final managerUser = Provider.of<ProfileViewModel>(context, listen: false);

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
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (managerUser.dataProfile!.id == widget.userId)
                                ? Row(
                                    children: [
                                      Text(
                                        value.threadDetail!.authorName!,
                                        style: poppinsRegular(14, Colors.black),
                                      ),
                                    ],
                                  )
                                : Row(
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
                            // Row(
                            //   children: [
                            //     Text(
                            //       value.threadDetail!.authorName!,
                            //       style: poppinsRegular(14, Colors.black),
                            //     ),
                            //     const SizedBox(width: 8),
                            //     const Icon(
                            //       Icons.noise_control_off_sharp,
                            //       size: 14,
                            //       color: Colors.grey,
                            //     ),
                            //     const SizedBox(width: 8),
                            //     Text(
                            //       'Ikuti',
                            //       style: poppinsRegular(14, infoColor),
                            //     ),
                            //   ],
                            // ),
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
                                      await Provider.of<ProfileViewModel>(
                                              context,
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
                                const SizedBox(width: 8),
                                IconButton(
                                  onPressed: () {
                                    modalBottomComment(
                                        context, width, false, 0);
                                  },
                                  icon: const Icon(Icons.chat),
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
                                  height: 100,
                                  padding: const EdgeInsets.all(16),
                                  child: managerUser.dataProfile!.id ==
                                          widget.userId
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ButtonIcon(
                                              label: 'Save',
                                              icon: Icons.bookmark,
                                              iconColor: Colors.white,
                                              bgColor: infoColor,
                                              outerRadius: 20,
                                              innerRadius: 20,
                                              onCreate: () {},
                                            ),
                                            ButtonIcon(
                                              label: 'Shared',
                                              icon: Icons.share,
                                              iconColor: Colors.white,
                                              bgColor: infoColor,
                                              outerRadius: 20,
                                              innerRadius: 20,
                                              onCreate: () {},
                                            ),
                                            ButtonIcon(
                                              label: 'Delete',
                                              icon: Icons.delete_forever,
                                              iconColor: Colors.white,
                                              bgColor: infoColor,
                                              outerRadius: 20,
                                              innerRadius: 20,
                                              onCreate: () {
                                                Provider.of<ProfileViewModel>(
                                                        context,
                                                        listen: false)
                                                    .deleteThread(
                                                  widget.id,
                                                  context,
                                                );
                                              },
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ButtonIcon(
                                              label: 'Save',
                                              icon: Icons.bookmark,
                                              iconColor: Colors.white,
                                              bgColor: infoColor,
                                              outerRadius: 20,
                                              innerRadius: 20,
                                              onCreate: () {},
                                            ),
                                            ButtonIcon(
                                              label: 'Shared',
                                              icon: Icons.share,
                                              iconColor: Colors.white,
                                              bgColor: infoColor,
                                              outerRadius: 20,
                                              innerRadius: 20,
                                              onCreate: () {},
                                            ),
                                          ],
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      height: 2,
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Komentar',
                        style: poppinsRegular(16, Colors.black),
                      ),
                    ),
                  ),
                  (value.allCommentList != null)
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          height: 400,
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      title: Text(value
                                          .allCommentList![index]!.authorName!),
                                      subtitle: Text(
                                          value.allCommentList![index]!.isi!),
                                    ),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     modalBottomComment(
                                    //       context,
                                    //       width,
                                    //       true,
                                    //       value.allCommentList![index]!.id,
                                    //     );
                                    //   },
                                    //   child: Text(
                                    //     'Balas',
                                    //     style:
                                    //         poppinsRegular(14, Colors.black54),
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 20),
                                    //   child: SizedBox(
                                    //     height: 150,
                                    //     child: (value.allCommentList![index]!
                                    //             .replyCommentDetail!.isNotEmpty)
                                    //         ? ListView.builder(
                                    //             itemBuilder: (context, index) {
                                    //               return ListTile(
                                    //                 contentPadding:
                                    //                     const EdgeInsets.all(0),
                                    //                 title: Text(
                                    //                   value
                                    //                       .allCommentList![
                                    //                           index]!
                                    //                       .replyCommentDetail![
                                    //                           index]
                                    //                       .authorName!,
                                    //                 ),
                                    //                 subtitle: Text(
                                    //                   value
                                    //                       .allCommentList![
                                    //                           index]!
                                    //                       .replyCommentDetail![
                                    //                           index]
                                    //                       .isi!,
                                    //                 ),
                                    //               );
                                    //             },
                                    //             itemCount: value
                                    //                 .allCommentList![index]!
                                    //                 .replyCommentDetail!
                                    //                 .length,
                                    //           )
                                    //         : const SizedBox(),
                                    //   ),
                                    // ),
                                  ],
                                );
                              },
                              itemCount: value.allCommentList!.length),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          },
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

  Future<dynamic> modalBottomComment(
      BuildContext context, double width, bool isReply, int? commentId) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.8,
                child: TextFormField(
                  controller: commentController,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  minLines: 1,
                  maxLines: 15,
                  decoration: const InputDecoration(
                    hintText: 'Tambahkan Komentar',
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  if (commentController.text.isNotEmpty) {
                    if (isReply == false) {
                      Provider.of<HomeViewModel>(context, listen: false)
                          .postComment(
                        widget.id,
                        commentController.text,
                        context,
                      );
                    } else {
                      Provider.of<HomeViewModel>(context, listen: false)
                          .postReplyComment(
                        widget.id,
                        commentId!,
                        commentController.text,
                        context,
                      );
                    }
                  } else {
                    Navigator.pop(context);
                  }
                  commentController.text = '';
                },
                icon: const Icon(
                  Icons.send,
                  color: infoColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
