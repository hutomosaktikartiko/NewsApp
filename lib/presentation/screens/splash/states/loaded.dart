import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/screen_navigator.dart';
import '../../../cubit/cubits.dart';
import '../../../widgets/custom_dialog.dart';
import '../../main/main_screen.dart';
import '../widgets/body.dart';

class Loaded extends StatelessWidget {
  const Loaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return checkStatus(context: context);
  }

  Widget checkStatus({required BuildContext context}) {
    SchedulerBinding.instance?.addPostFrameCallback(
      (_) async {
        context.read<TabCategoryCubit>();
        context.read<NewsCubit>();
        ScreenNavigator.replaceScreen(context, MainScreen());
      },
    );
    return Body(
      child: CustomDialogs.showCircularProgressIndicator(),
    );
  }
}
