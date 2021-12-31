import 'package:flutter/material.dart';
import 'package:news_app/core/config/custom_text_style.dart';
import 'package:news_app/core/config/size_config.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight / 2,
      child: Center(
        child: Text(
          "Data berita tidak ditemukan",
          textAlign: TextAlign.center,
          style: CustomTextStyle.subHeading2.copyWith(
            fontSize: 15,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
