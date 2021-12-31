import 'package:flutter/material.dart';

import '../../../../core/config/custom_color.dart';
import '../../../../core/config/size_config.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          gradient: CustomColor.linearGradient(
            colorBegin: CustomColor.main,
            colorEnd: CustomColor.main2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/logo.jpg",
                height: 100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            child,
          ],
        ),
      ),
    );
  }
}