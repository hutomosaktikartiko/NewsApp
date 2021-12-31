import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/config/labels_config.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  InternetConnectionCubit({
    required this.internetConnectionChecker,
  }) : super(InternetConnectionInitial()) {
    monitorInternetConnection();
  }

  final InternetConnectionChecker? internetConnectionChecker;

  StreamSubscription? internetConnectionStreamSubscription;

  void monitorInternetConnection() async {
    internetConnectionStreamSubscription =
        InternetConnectionChecker().onStatusChange.listen(
      (status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            emit(
              InternetConnectionConnected(
                  internetConnectionStatus: InternetConnectionStatus.connected),
            );
            break;
          case InternetConnectionStatus.disconnected:
            emit(
              InternetConnectionDisconnected(message: LabelsConfig.noInternet),
            );
            break;
        }
      },
    );
  }

  @override
  Future<void> close() async {
    internetConnectionStreamSubscription?.cancel();
    return super.close();
  }
}
