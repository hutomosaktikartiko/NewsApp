import 'package:flutter/material.dart';

import '../../core/config/custom_color.dart';
import '../../core/config/custom_text_style.dart';
import '../../core/config/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.label,
    this.onTap,
    this.labelColor,
    this.paddingVertical,
    this.backgroundColor,
    this.fontSize,
    this.width,
    this.child,
  }) : super(key: key);

  final String? label;
  final double? width, paddingVertical, fontSize;
  final Widget? child;
  final Function? onTap;
  final Color? labelColor, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        primary: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: CustomColor.main,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 12),
        width: width ?? SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: backgroundColor ?? CustomColor.main,
          border: Border.all(
            color: CustomColor.main,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child ?? SizedBox.shrink(),
            Text(
              "$label",
              style: CustomTextStyle.subHeading2.copyWith(
                color: labelColor ?? Colors.white,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}