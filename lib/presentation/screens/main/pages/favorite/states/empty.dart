import 'package:flutter/material.dart';

import '../../../../../../core/config/custom_text_style.dart';
import '../../../../../../core/config/size_config.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.35,
        ),
        Center(
          child: Text(
            "Data berita tidak ditemukan",
            textAlign: TextAlign.center,
            style: CustomTextStyle.subHeading2.copyWith(
              fontSize: 15,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
