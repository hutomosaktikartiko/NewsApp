import 'package:flutter/material.dart';

import '../../../widgets/custom_dialog.dart';
import '../widgets/body.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Body(
      child: CustomDialogs.showCircularProgressIndicator(),
    );
  }
}