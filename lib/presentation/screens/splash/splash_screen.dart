import 'package:flutter/material.dart';
import 'package:news_app/presentation/widgets/check_connection_screen.dart';

import '../../../core/config/size_config.dart';
import 'states/error.dart';
import 'states/loaded.dart';
import 'states/loading.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return CheckConnectionScreen(
      internetConnectionConnected: () {
        return Loaded();
      },
      internetConnectionDisconnected: () {
        return Error();
      },
      loading: () {
        return Loading();
      },
    );
  }
}