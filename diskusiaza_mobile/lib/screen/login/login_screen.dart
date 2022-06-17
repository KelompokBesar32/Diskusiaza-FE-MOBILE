import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/button_primary.dart';
import 'package:diskusiaza_mobile/widgets/input_date_picker.dart';
import 'package:diskusiaza_mobile/widgets/input_gender_picker.dart';
import 'package:diskusiaza_mobile/widgets/input_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isRemember = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
              height: height * 0.4,
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
                height: height * 0.6,
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
                        'Login',
                        style: poppinsRegular(16, Colors.black),
                      ),
                      InputTextField(
                        controller: emailController,
                        hintText: 'Email',
                        suffix: false,
                      ),
                      InputTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        suffix: true,
                      ),
                      ButtonPrimary(
                        width: width,
                        label: 'Login',
                        onCreate: () {
                          if (_formKey.currentState!.validate()) {
                            print('Success');
                          }
                        },
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: Transform.translate(
                          offset: const Offset(-10, 0),
                          child: Checkbox(
                            value: isRemember,
                            activeColor: infoColor,
                            onChanged: (value) {
                              setState(() {
                                isRemember = value!;
                              });
                            },
                          ),
                        ),
                        title: Transform.translate(
                          offset: const Offset(-30, 0),
                          child: Text(
                            'Ingat saya',
                            style: poppinsLight(
                              12,
                              Colors.black,
                            ),
                          ),
                        ),
                        trailing: Text(
                          'Perlu bantuan?',
                          style: poppinsLight(
                            12,
                            Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '--- Or Log In With ---',
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
                            'Don\'t Have an account? ',
                            style: poppinsLight(12, Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                            child: Text(
                              'Sign Up',
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
