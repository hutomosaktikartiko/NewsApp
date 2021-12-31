import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(
    BlocBase bloc,
    Change change,
  ) {
    super.onChange(
      bloc,
      change,
    );
    log('onChange: ${bloc.runtimeType}, ${bloc.state} \nCurrent state: ${change.currentState}\nNext state: ${change.nextState}');
  }

  @override
  void onError(
    BlocBase bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    log('onError(${bloc.runtimeType}, ${bloc.state}, $error, $stackTrace)');
    super.onError(
      bloc,
      error,
      stackTrace,
    );
  }

  @override
  void onEvent(
    Bloc bloc,
    Object? event,
  ) {
    log('onEvent(${bloc.state}, ${bloc.runtimeType}, $event)');
    super.onEvent(
      bloc,
      event,
    );
  }

  @override
  void onTransition(
    Bloc bloc,
    Transition transition,
  ) {
    log('onTransition(${bloc.state}, ${bloc.runtimeType}, ${transition.currentState}, ${transition.nextState})');
    super.onTransition(
      bloc,
      transition,
    );
  }

  @override
  void onCreate(BlocBase bloc) {
    log('onCreate(${bloc.state}, ${bloc.runtimeType})');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log('onTransition(${bloc.state}, ${bloc.runtimeType})');
    super.onClose(bloc);
  }
}