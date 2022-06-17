import 'package:diskusiaza_mobile/shared/constant.dart';
import 'package:diskusiaza_mobile/widgets/InputTextField.dart';
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

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.3,
            width: width,
            child: Center(
              child: Text(
                'Diskusiaza',
                style: poppinsBold,
              ),
            ),
          ),
          Container(
            height: height * 0.7,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: background,
            ),
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar',
                  style: poppinsRegular,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputTextField(
                        controller: firstNameController,
                        hintText: 'First Name',
                        suffix: false,
                      ),
                      InputTextField(
                        controller: lastNameController,
                        hintText: 'Last Name',
                        suffix: false,
                      ),
                      InputTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        suffix: true,
                      ),
                      InputTextField(
                        controller: passwordController,
                        hintText: 'Confirm Password',
                        suffix: true,
                      ),
                      Text(
                        'Tanggal Lahir',
                        style: poppinsRegular,
                      ),
                      TextField()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
