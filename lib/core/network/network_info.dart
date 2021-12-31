import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// return [true] if connection status is connected
/// 
/// or return [false] if connection status is disconnected
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl({required this.internetConnectionChecker});
  
  @override
  Future<bool> get isConnected async => await internetConnectionChecker.hasConnection;
}