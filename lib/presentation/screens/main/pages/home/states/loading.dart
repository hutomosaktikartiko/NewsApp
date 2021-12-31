import 'package:flutter/material.dart';

import '../../../../../../core/config/size_config.dart';
import '../../../../../widgets/custom_shimmer.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CustomShimmer.circular(
              width: SizeConfig.screenWidth,
              height: 150,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ).toList()
      ],
    );
  }
}
