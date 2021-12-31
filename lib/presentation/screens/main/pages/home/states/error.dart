import 'package:flutter/material.dart';
import 'package:news_app/core/config/custom_text_style.dart';
import 'package:news_app/core/config/size_config.dart';

class Error extends StatelessWidget {
  const Error({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight / 2,
      child: Center(
        child: Text(
          message,
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
