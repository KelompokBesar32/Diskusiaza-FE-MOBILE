import 'package:diskusiaza_mobile/screens/home/home_view_model.dart';
import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/avatar_pict.dart';
import 'package:diskusiaza_mobile/widgets/button_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadCard extends StatelessWidget {
  final int index;
  final int id;
  final String judul;
  final String isi;
  final int dilihat;
  final String kategoriName;
  final String authorName;
  final int totalLike;
  final bool isLike;
  final bool isUser;
  final double width;
  const ThreadCard({
    Key? key,
    required this.index,
    required this.id,
    required this.judul,
    required this.isi,
    required this.dilihat,
    required this.kategoriName,
    required this.authorName,
    required this.totalLike,
    required this.isLike,
    required this.isUser,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                          authorName,
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
                      judul,
                      style: poppinsMedium(14, Colors.black),
                    ),
                    Text(
                      isi,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 5,
                      style: poppinsLight(13, Colors.black),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Row(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (isUser == true) {
                              await Provider.of<ProfileViewModel>(context,
                                      listen: false)
                                  .postLikeThread(
                                id,
                                index,
                                context,
                              );
                            } else {
                              await Provider.of<HomeViewModel>(context,
                                      listen: false)
                                  .postLikeThread(
                                id,
                                index,
                                context,
                              );
                            }
                          },
                          child: isLike
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
                          // totalLike.toString(),
                          isLike
                              ? (totalLike + 1).toString()
                              : (totalLike).toString(),
                          style: poppinsLight(13, Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        const Icon(Icons.remove_red_eye_rounded),
                        const SizedBox(width: 4),
                        Text(
                          dilihat.toString(),
                          style: poppinsLight(13, Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Text(
                  kategoriName,
                  style: poppinsLight(13, Colors.black),
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
                          child: isUser
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ButtonIcon(
                                      label: 'Edit',
                                      icon: Icons.edit,
                                      iconColor: Colors.white,
                                      bgColor: infoColor,
                                      outerRadius: 40,
                                      innerRadius: 40,
                                      onCreate: () {
                                        threadEditDialog(context);
                                      },
                                    ),
                                    ButtonIcon(
                                      label: 'Save',
                                      icon: Icons.bookmark,
                                      iconColor: Colors.white,
                                      bgColor: infoColor,
                                      outerRadius: 40,
                                      innerRadius: 40,
                                      onCreate: () {},
                                    ),
                                    ButtonIcon(
                                      label: 'Delete',
                                      icon: Icons.delete_forever,
                                      iconColor: Colors.white,
                                      bgColor: infoColor,
                                      outerRadius: 40,
                                      innerRadius: 40,
                                      onCreate: () {
                                        Provider.of<ProfileViewModel>(context,
                                                listen: false)
                                            .deleteThread(
                                          id,
                                          context,
                                        );
                                      },
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [],
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
        ),
      ),
    );
  }

  Future<dynamic> threadEditDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        final formKey = GlobalKey<FormState>();
        final titleController = TextEditingController();
        final contentController = TextEditingController();

        String categoryValue = kategoriName;

        var categoryItems = [
          'Cerita Lucu',
          'Tips & Trick',
          'Kisah-kisah Horror',
          'Pengembangan Diri',
          'Kisah Hidup yang tak banyak diketahui',
          'Informasi Olahraga',
        ];

        String visibleValue = 'Publik';

        var visibleItems = [
          'Publik',
          'Private',
        ];

        titleController.text = judul;
        contentController.text = isi;

        return StatefulBuilder(
          builder: ((context, setState) {
            return AlertDialog(
              title: SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Edit Kiriman Informasi'),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const AvatarPict(
                          urlPict: 'assets/images/fotoProfile.jpg',
                          radiusPict: 20,
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
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
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
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
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
                          children: const [
                            Icon(Icons.type_specimen_outlined, size: 28),
                            SizedBox(width: 10),
                            Icon(Icons.image, size: 28),
                          ],
                        ),
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(horizontal: 16),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(infoColor),
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
                                case 'Kisah Hidup yang tak banyak diketahui':
                                  catIndex = 5;
                                  break;
                                case 'Informasi Olahraga':
                                  catIndex = 6;
                                  break;
                              }

                              Provider.of<ProfileViewModel>(context,
                                      listen: false)
                                  .updateThread(
                                id,
                                titleController.text,
                                contentController.text,
                                catIndex,
                                null,
                                visibleValue,
                                context,
                              );
                            }
                          },
                          child: Text(
                            'Edit kiriman',
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
        );
      },
    );
  }
}
