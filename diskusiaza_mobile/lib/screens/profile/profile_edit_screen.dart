import 'package:diskusiaza_mobile/screens/profile/profile_view_model.dart';
import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/button_secondary.dart';
import 'package:diskusiaza_mobile/widgets/input_date_picker.dart';
import 'package:diskusiaza_mobile/widgets/input_gender_picker.dart';
import 'package:diskusiaza_mobile/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final formKey = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  String? gender;
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    var manager = Provider.of<ProfileViewModel>(context, listen: false);

    firstNameController.text = manager.dataProfile!.firstname!;
    lastNameController.text = manager.dataProfile!.lastname!;
    phoneController.text = manager.dataProfile!.nohp!;
    dateController.text = manager.dataProfile!.tanggalLahir!;
    if (manager.dataProfile!.jenisKelamin == 'L') {
      manager.genderController = Gender.L;
    } else if (manager.dataProfile!.jenisKelamin == 'P') {
      manager.genderController = Gender.P;
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    var manager = Provider.of<ProfileViewModel>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                          onCreate: () {
                            if (formKey.currentState!.validate()) {
                              if (manager.genderController == Gender.L) {
                                gender = "L";
                              } else if (manager.genderController == Gender.P) {
                                gender = "P";
                              }

                              Provider.of<ProfileViewModel>(context,
                                      listen: false)
                                  .updateDataProfile(
                                firstNameController.text.trim(),
                                lastNameController.text.trim(),
                                phoneController.text.trim(),
                                dateController.text,
                                gender!,
                                passwordController.text,
                                context,
                              );
                            }
                          },
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
                  padding: const EdgeInsets.fromLTRB(12, 40, 12, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.45,
                            child: InputTextField(
                              controller: firstNameController,
                              hintText: 'First Name',
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{3,}$');
                                if (value!.isEmpty) {
                                  return ("Firstname cannot be Empty");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("(Min. 3 Character)");
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: width * 0.45,
                            child: InputTextField(
                              controller: lastNameController,
                              hintText: 'Last Name',
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{3,}$');
                                if (value!.isEmpty) {
                                  return ("Lastname cannot be Empty");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("(Min. 3 Character)");
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      InputTextField(
                        controller: phoneController,
                        hintText: 'Phone Number',
                        validator: (value) {
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Tanggal Lahir',
                        style: poppinsRegular(16, Colors.black),
                      ),
                      const SizedBox(height: 8),
                      InputDatePicker(
                        dateController: dateController,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Jenis Kelamin',
                        style: poppinsRegular(16, Colors.black),
                      ),
                      const SizedBox(height: 8),
                      GenderPicker(
                        height: height,
                        width: width * 0.45,
                        controller: manager.genderController,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        obscureText: !passwordVisible,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{3,}$');

                          if (value!.isNotEmpty) {
                            if (!regex.hasMatch(value)) {
                              return ("Min. 3 Character");
                            }
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: infoColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordConfirmController,
                        obscureText: !passwordVisible,
                        validator: (value) {
                          if (passwordConfirmController.text !=
                              passwordController.text) {
                            return "Password don't match";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          hintText: 'Confirm Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: infoColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
