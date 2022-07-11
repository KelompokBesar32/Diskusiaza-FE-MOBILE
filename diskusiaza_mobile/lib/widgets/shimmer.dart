import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// class ShimmerLoad extends StatelessWidget {
//   const ShimmerLoad({
//     Key? key,
//     required this.width,
//     required this.height,
//     required this.radius,
//   }) : super(key: key);

//   final double width;
//   final double height;
//   final double radius;

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade400,
//       highlightColor: Colors.grey.shade300,
//       child: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(radius)),
//       ),
//     );
//   }
// }
class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
  }) : super(key: key);

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(radius)),
    );
  }
}
