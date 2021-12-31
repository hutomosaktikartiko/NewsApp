import 'package:flutter/material.dart';
import 'package:news_app/core/config/custom_color.dart';


class DimissibleBackground extends StatelessWidget {
  const DimissibleBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: UniversalColor.red,
      ),
      child: Align(
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
