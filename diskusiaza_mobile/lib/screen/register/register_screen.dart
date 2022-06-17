import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/button_primary.dart';
import 'package:diskusiaza_mobile/widgets/input_date_picker.dart';
import 'package:diskusiaza_mobile/widgets/input_gender_picker.dart';
import 'package:diskusiaza_mobile/widgets/input_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: height * 0.20,
              width: width,
              child: Center(
                child: Text(
                  'Diskusiaza',
                  style: poppinsBold(24, infoColor),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.80,
                width: width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: backgroundPrimaryColor,
                ),
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daftar',
                        style: poppinsRegular(16, Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.42,
                            child: InputTextField(
                              controller: firstNameController,
                              hintText: 'First Name',
                              isPassword: false,
                              suffix: false,
                              onCreate: (value) {
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
                            width: width * 0.42,
                            child: InputTextField(
                              controller: lastNameController,
                              hintText: 'Last Name',
                              isPassword: false,
                              suffix: false,
                              onCreate: (value) {
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
                      InputTextField(
                        controller: emailController,
                        hintText: 'Email',
                        isPassword: false,
                        suffix: false,
                        onCreate: (value) {
                          if (value!.isEmpty) {
                            return ("Email cannot be Empty");
                          }
                          if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[.]+[a-z]")
                              .hasMatch(value)) {
                            return ("Please Enter a valid email");
                          }
                          return null;
                        },
                      ),
                      InputTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        isPassword: true,
                        suffix: true,
                        onCreate: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Password cannot be Empty");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Password(Min. 6 Character)");
                          }
                          return null;
                        },
                      ),
                      InputTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        isPassword: true,
                        suffix: true,
                        onCreate: (value) {
                          if (value!.isEmpty) {
                            return ("Confirm Password cannot be Empty");
                          }
                          if (confirmPasswordController.text !=
                              passwordController.text) {
                            return "Password don't match";
                          }
                          return null;
                        },
                      ),
                      Text(
                        'Tanggal Lahir',
                        style: poppinsRegular(16, Colors.black),
                      ),
                      InputDatePicker(
                        dateController: dateController,
                      ),
                      Text(
                        'Jenis Kelamin',
                        style: poppinsRegular(16, Colors.black),
                      ),
                      GenderPicker(height: height, width: width),
                      const SizedBox(height: 8),
                      ButtonPrimary(
                        width: width,
                        label: 'Sign Up',
                        onCreate: () {
                          if (_formKey.currentState!.validate()) {
                            print('Success');
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '--- Or Sign Up With ---',
                          style: poppinsRegular(12, Colors.black),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          addOnSignUp('G', 'Google'),
                          addOnSignUp('A', 'Apple Id'),
                          addOnSignUp('F', 'Facebook'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account? ',
                            style: poppinsLight(12, Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/login');
                            },
                            child: Text(
                              'Log in',
                              style: poppinsLight(12, infoColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container addOnSignUp(String logo, String value) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black38,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            logo,
            style: poppinsLight(
              10,
              Colors.black,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            value,
            style: poppinsRegular(
              10,
              Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
