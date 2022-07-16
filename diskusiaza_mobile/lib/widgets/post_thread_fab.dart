import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/avatar_pict.dart';
import 'package:diskusiaza_mobile/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostThreadFAB extends StatelessWidget {
  const PostThreadFAB({
    Key? key,
    required this.isUser,
    required this.width,
  }) : super(key: key);

  final double width;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<ProfileViewModel>(context, listen: false);
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            final formKey = GlobalKey<FormState>();
            final titleController = TextEditingController();
            final contentController = TextEditingController();

            String categoryValue = 'Cerita Lucu';

            var categoryItems = [
              'Cerita Lucu',
              'Tips & Trick',
              'Kisah-kisah Horror',
              'Pengembangan Diri',
              'Kisah hidup yang tak banyak diketahui',
              'Informasi Olahraga',
            ];

            String visibleValue = 'Publik';

            var visibleItems = [
              'Publik',
              'Private',
            ];

            return Center(
              child: SingleChildScrollView(
                child: StatefulBuilder(
                  builder: ((context, setState) {
                    return AlertDialog(
                      title: SizedBox(
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Tulis Kiriman Informasi'),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                (value.dataProfile!.foto != null ||
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
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: DropdownButton(
                                    value: visibleValue,
                                    style: poppinsLight(14, Colors.black),
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_rounded),
                                    items: visibleItems.map((items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        visibleValue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: titleController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    validator: (v) {
                                      if (v!.trim().isEmpty) {
                                        return 'Please enter something';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Judul...',
                                    ),
                                  ),
                                  TextFormField(
                                    controller: contentController,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 10,
                                    validator: (v) {
                                      if (v!.trim().isEmpty) {
                                        return 'Please enter something';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Katakan sesuatu...',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Kategori : ',
                                  style: poppinsLight(15, Colors.black),
                                ),
                                DropdownButton(
                                  value: categoryValue,
                                  style: poppinsLight(14, Colors.black),
                                  isDense: true,
                                  isExpanded: true,
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                  items: categoryItems.map((items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      categoryValue = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.type_specimen_outlined,
                                        size: 28),
                                    const SizedBox(width: 10),
                                    IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(15),
                                              ),
                                            ),
                                            builder: (context) {
                                              return Container(
                                                height: 225,
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ButtonIcon(
                                                      label: 'Gallery',
                                                      icon: Icons.image,
                                                      iconColor: Colors.white,
                                                      bgColor: infoColor,
                                                      outerRadius: 40,
                                                      innerRadius: 40,
                                                      onCreate: () async {
                                                        await Provider.of<
                                                                    HomeViewModel>(
                                                                context,
                                                                listen: false)
                                                            .openGallery(
                                                                context);
                                                        setState(() {});
                                                      },
                                                    ),
                                                    ButtonIcon(
                                                      label: 'Camera',
                                                      icon: Icons.camera_alt,
                                                      iconColor: Colors.white,
                                                      bgColor: infoColor,
                                                      outerRadius: 40,
                                                      innerRadius: 40,
                                                      onCreate: () async {
                                                        await Provider.of<
                                                                    HomeViewModel>(
                                                                context,
                                                                listen: false)
                                                            .openCamera(
                                                                context);
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        icon:
                                            const Icon(Icons.image, size: 28)),
                                  ],
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                      const EdgeInsets.symmetric(
                                          horizontal: 16),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            infoColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: const BorderSide(
                                          color: Colors.black38,
                                          width: 0.8,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      int catIndex = 1;
                                      switch (categoryValue) {
                                        case 'Cerita Lucu':
                                          catIndex = 1;
                                          break;
                                        case 'Tips & Trick':
                                          catIndex = 2;
                                          break;
                                        case 'Kisah-kisah Horror':
                                          catIndex = 3;
                                          break;
                                        case 'Pengembangan Diri':
                                          catIndex = 4;
                                          break;
                                        case 'Kisah hidup yang tak banyak diketahui':
                                          catIndex = 5;
                                          break;
                                        case 'Informasi Olahraga':
                                          catIndex = 6;
                                          break;
                                      }

                                      // isUser
                                      //     ? Provider.of<ProfileViewModel>(
                                      //             context,
                                      //             listen: false)
                                      //         .postThread(
                                      //         titleController.text,
                                      //         contentController.text,
                                      //         catIndex,
                                      //         context,
                                      //       )
                                      // :
                                      Provider.of<HomeViewModel>(context,
                                              listen: false)
                                          .postThread(
                                        titleController.text,
                                        contentController.text,
                                        catIndex,
                                        context,
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Kirimkan',
                                    style: poppinsRegular(14, Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            );
          },
        );
      },
      child: const Icon(
        Icons.add,
        size: 28,
      ),
    );
  }
}
