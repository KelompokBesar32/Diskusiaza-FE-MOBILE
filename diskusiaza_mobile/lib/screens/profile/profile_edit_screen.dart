import 'package:diskusiaza_mobile/widgets/button_secondary.dart';
import 'package:diskusiaza_mobile/widgets/input_text_field_secondary.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final keahlianController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: ButtonSecondary(
                      title: 'Simpan',
                      onCreate: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              width: width,
              child: Stack(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image: const AssetImage(
                              'assets/images/fotoSampul.jpg',
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.6),
                              BlendMode.dstATop,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 12,
                    bottom: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(45),
                              child: Container(
                                height: 200,
                                width: width,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                    image: const AssetImage(
                                      'assets/images/fotoProfile.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.6),
                                      BlendMode.dstATop,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 40, 12, 0),
              child: Form(
                child: Column(
                  children: [
                    InputTextFieldSecondary(
                      controller: nameController,
                      hintText: 'Nama',
                      validator: (value) {},
                    ),
                    const SizedBox(height: 30),
                    InputTextFieldSecondary(
                      controller: keahlianController,
                      hintText: 'Keahlian atau Gelar',
                      validator: (value) {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
