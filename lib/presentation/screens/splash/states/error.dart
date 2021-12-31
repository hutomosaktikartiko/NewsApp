import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/custom_color.dart';
import '../../../cubit/cubits.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_dialog.dart';
import '../widgets/body.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBody(context: context);
  }

  Widget buildBody({required BuildContext context}) {
    Future.delayed(
      Duration.zero,
      () => CustomDialogs.showToast(
        message: "Periksa internet anda",
        context: context,
        backgroundColor: UniversalColor.red,
      ),
    );

    return Body(
      child: CustomButton(
        backgroundColor: UniversalColor.red,
        label: "Muat ulang",
        width: 100,
        onTap: () => context.read<InternetConnectionCubit>(),
      ),
    );

    // DEV -> Comment this for go in with no internet
    // SchedulerBinding.instance?.addPostFrameCallback((_) async {
    //   ScreenNavigator.replaceScreen(context, MainScreen());
    // });

    // return Body(
    //   child: CustomDialog.showCircularProgressIndicator(),
    // );
  }
}