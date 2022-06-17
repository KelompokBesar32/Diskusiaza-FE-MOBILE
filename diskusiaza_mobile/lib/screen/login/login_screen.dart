// import 'package:diskusiaza_mobile/shared/constant.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var mediaQueryData = MediaQuery.of(context);
//     var height = mediaQueryData.size.height;
//     var width = mediaQueryData.size.width;

//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: height * 0.3,
//                   width: width,
//                   child: Center(
//                     child: Text(
//                       'Diskusiaza',
//                       style: poppinsBold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.7,
//                   width: width,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: background,
//                     ),
//                     padding: const EdgeInsets.all(36.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Daftar',
//                           style: poppinsRegular,
//                         ),
//                         Row(
//                           children: [],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
