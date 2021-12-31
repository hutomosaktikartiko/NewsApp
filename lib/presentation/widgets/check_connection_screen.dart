import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubits.dart';


class CheckConnectionScreen extends StatelessWidget {
  /// Screen for listen the internet status [Connected] or [Disconnected]
  ///
  /// Used for screen that require the [Real Time] internet status
  ///
  /// Default value is return [LoadingIndicator]
  const CheckConnectionScreen({
    Key? key,
    required this.internetConnectionConnected,
    required this.internetConnectionDisconnected,
    required this.loading,
  }) : super(key: key);

  /// State when Internet status is [Connected]
  final Function internetConnectionConnected;

  /// State when Internet status is [Disconnected]
  final Function internetConnectionDisconnected;

  /// State when loading
  final Function loading;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
      builder: (context, state) {
        if (state is InternetConnectionConnected) {
          return internetConnectionConnected();
        } else if (state is InternetConnectionDisconnected) {
          return internetConnectionDisconnected();
        } else {
          return loading();
        }
      },
    );
  }
}