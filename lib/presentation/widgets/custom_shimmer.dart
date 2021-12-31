import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer.rectangular({
    this.width = double.infinity,
    required this.height,
  }) : this.shapeBorder = const RoundedRectangleBorder();

  const CustomShimmer.circular({
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });

  final double width, height;
  final ShapeBorder shapeBorder;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: shapeBorder,
          color: Color(0xFFEBEBF4),
        ),
      ),
      baseColor: Color(0xFFEBEBF4),
      highlightColor: Color(0xFFF4F4F4),
    );
  }
}